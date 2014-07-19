ActiveAdmin.register User do
  remove_filter :users_conversations
  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :forem_admin
    end
    f.actions
  end
  permit_params(:email, :password, :password_confirmation, :forem_admin)
  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
