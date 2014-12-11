class TasksController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :authorize_member
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]

  def index
    if params[:show_complete]
      @tasks = @project.tasks.order(params[:sort_by]).page(params[:page]).per(5).all
    else
      @tasks = @project.tasks.where(complete: false).order(params[:sort_by]).page(params[:page])
    end

  end

  def show
    @comments = @task.comments.all.where(params[:task_id])
    @comment = @task.comments.new
  end

  def new
    @task = @project.tasks.new
  end

  def edit

  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def toggle
    @task.update(complete: !@task.complete)
    taskparam = {show_complete: params[:show_complete], sort_by: params[:sort_by], page: params[:page]}
    redirect_to project_tasks_path(@project, taskparam)
  end


  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_tasks_url, notice: 'Task was successfully destroyed.'}
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @project.tasks.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :complete, :due_date, :page)
    end
end
