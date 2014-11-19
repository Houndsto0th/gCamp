class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
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
      redirect_to @project, notice: "Project Creation: Success!"
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
