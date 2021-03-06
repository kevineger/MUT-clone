class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /conversations
  # GET /conversations.json
  def index
    user = User.find(current_user.id)
    user.unread = false
    user.save!
    @message = Message.new
    @conversations = current_user.conversations
    respond_to do |format|
      format.js
    end
  end
  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @message = Message.new
    @conversation.users.each do |user|
      @other_user = user
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /conversations/new
  def new
    @send_to = User.find(params[:user])
    @subject
    if params.has_key?(:post)
      @post = ClassifiedPost.find(params[:post])
      @subject = @post.title.to_s
    end
    @conversation = Conversation.new
    @conversation.messages.build
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params.except(:user_id))
    other_user = User.find(conversation_params[:user_id])
    @conversation.users << current_user
    @conversation.users << other_user
    respond_to do |format|
      if @conversation.save
        new_message_alert! @conversation
        MessageNotifier.send_first_message_notification(other_user,current_user,@conversation).deliver
        format.html { redirect_to '/profile/'+current_user.id.to_s+'#messages', notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:name,:subject, :user_id,  messages_attributes: [:body,:user_id])
    end
end
