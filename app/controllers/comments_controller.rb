class CommentsController < ApplicationController

  before_action do
    @task = Task.find(params[:task_id])
  end

  def index

  end

  def new
  end


end
