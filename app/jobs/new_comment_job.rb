class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(message:, current_user:)
    binding.irb
    payload = {
      html: ApplicationController.render(partial: "messages/message", 
                                         locals: {
                                           message: message, 
                                           current_sender: (current_user == message.user)
                                          }),
      content: message.content,
      sender: message.user.email.split("@").first,
      current?: (current_user == message.user ? true : nil),
      room_id: message.room.id
    }.compact
    ActionCable.server.broadcast("room_channel_#{message.room_id}", payload)
  end
end
