class MembershipsController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :authorize_owner, only: [:update]
  before_action :authorize_member

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
    end
  end


  def edit
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    if last_member?
      redirect_to project_memberships_path(@project), notice: "You can't remove the last member of a project"
    else
      @membership.destroy
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was removed successfully"
    end
  end


  private

    def membership_params
      params.require(:membership).permit(:role, :user_id, :project_id)
    end

    def last_member?
      @project.memberships.count == 1
    end



end
