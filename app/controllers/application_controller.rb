class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class AccessDenied < StandardError
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def ensure_logged_in
    if current_user.nil?
      redirect_to signin_path, notice: "You must be logged in to access that action"
    end
  end

  def authorize_member
    current_user.member?(@project)
  end

  def authorize_owner
    current_user.owner?(@project)
  end

  def check_for_auth
    raise AccessDenied unless current_user.member?(@project)
  end


  def denied
    render "public/404", status: 404, layout: false
  end


  rescue_from AccessDenied, with: :denied

  helper_method :current_user

  before_action :ensure_logged_in

end
