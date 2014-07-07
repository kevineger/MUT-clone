class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.forem_admin
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
