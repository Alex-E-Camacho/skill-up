class ConversationsController < ApplicationController
before_action :authenticate_user

  def index
  @users = User.all
  @conversations = Conversation.all
  end

  def create
    @conversation = Conversation.find_or_create_by(conversation_params)
    redirect_to  conversation_messages_path(@conversation)
  end

  private

  def conversation_params
  params.require(:conversation).permit(:sender_id, :recipient_id)
  end

end
