class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner, only: [:edit, :update, :destroy]
  before_action :authorize_member

  def index
    if current_user.admin?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
    tracker_api = TrackerAPI.new
    @tracker_projects = tracker_api.projects(current_user.pivot_token)
  end

  def stories
   @tracker_stories = TrackerAPI.new.stories(params[:tracker_id], current_user.pivot_token)
   @projectname = TrackerAPI.new.projects(current_user.pivot_token)
   Kaminari.paginate_array(@tracker_stories).page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def update
    if @project.update(project_params)
    redirect_to project_path, notice: "Project Update: Success!"
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      Membership.create!(project_id: @project.id, user_id: current_user.id, role: "owner")
      redirect_to project_tasks_path(@project), notice: "Project Creation: Success!"
    else
      render :new
    end
  end

  def destroy
    @project.destroy
      redirect_to projects_path, notice: "Project Deletion: Success!"
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:proj_name)
  end

end
