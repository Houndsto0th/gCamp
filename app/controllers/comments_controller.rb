class CommentsController < ApplicationController
  
  before_action do
    @task = Task.find(params[:task_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment saved"
    else
      redirect_to project_task_path(@project, @task)
    end
  end



  private
    def comment_params
      params.require(:comment).permit(:user_id, :task_id, :comment)
    end


end
