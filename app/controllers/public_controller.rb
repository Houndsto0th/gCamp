class PublicController < ActionController::Base
  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end