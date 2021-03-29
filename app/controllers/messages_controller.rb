class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.new(message_params) 
    if @message.save
      NewCommentJob.perform_later(@message)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def message_params
      params.require(:message).permit(:content, :room_id)
    end
end
