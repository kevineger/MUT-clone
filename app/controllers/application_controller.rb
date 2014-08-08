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

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
