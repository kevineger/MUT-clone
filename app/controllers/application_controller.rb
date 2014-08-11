class ApplicationController < ActionController::Base
  def new_message_alert!(conversation)
    conversation.users.each do |user|
      if user != current_user
        user.unread = true
        user.save!
      end
    end
  end
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
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
