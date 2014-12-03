class MembershipsController < ApplicationController

  before_action :authorize_member
  before_action :authorize_owner
  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @membership = @project.memberships.new
    @memberships = @project.memberships.all
  end

  def new
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully"
    else
      render :index
    end
  end

  def update
    @membership = @project.memberships.find(params[:id])
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was updated successfully"
    else
      render :edit
    end
  end


  def edit
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was removed successfully"

  end


  private

    def membership_params
      params.require(:membership).permit(:role, :user_id, :project_id)
    end



end
