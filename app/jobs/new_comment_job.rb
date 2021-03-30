class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(message:, current_user:)
    payload = {
      usermessage_html: ApplicationController.render(partial: "messages/usermessage", 
                                                     locals: {message: message}),
      othersender_html: ApplicationController.render(partial: "messages/othersender", 
                                                     locals: {message: message}),
      content: message.content,
      sender: message.user.email.split("@").first,
      user_id: current_user.id,
      room_id: message.room.id
    }
    ActionCable.server.broadcast("room_channel_#{message.room_id}", payload)
  end
end
