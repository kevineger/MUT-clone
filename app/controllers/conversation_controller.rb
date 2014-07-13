class ConversationController < ApplicationController
  def show
    @conversation = params[:conversation]
  end
  def new
    @user = User.find(params[:user_id]);
  end
  def create
    @user = User.find(params['user_id']);
    @conversation = current_user.send_message(@user, params[:body],params[:subject])
    redirect_to conversation_show_path, :conversation => @conversation
  end
end
