class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User Saved: Success!"
    else
      render new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
      redirect_to users_path, notice: "User Deletion: Success!"

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User Update: Success!"
    else
      render :edit
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
