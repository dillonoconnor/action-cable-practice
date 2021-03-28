class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def message_params
      params.require(:message).permit(:content)
    end
end
