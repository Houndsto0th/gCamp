class TasksController < ApplicationController

  before_action :authorize_member, only: [:index]
  before_action :authorize_owner
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]

  # before_action :check_for_auth

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:show_complete]
      @tasks = @project.tasks.order(params[:sort_by]).page(params[:page]).per(5).all
    else
      @tasks = @project.tasks.where(complete: false).order(params[:sort_by]).page(params[:page])
    end

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @comments = @task.comments.all.where(params[:task_id])
    @comment = @task.comments.new
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit

  end


  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path(@project), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'}
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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
