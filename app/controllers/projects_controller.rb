class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_member, only: [:index]
  before_action :authorize_owner

  def index
    @projects = current_user.projects
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
      Membership.create!(project_id: @project.id, user_id: current_user.id, role: "Owner")
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
