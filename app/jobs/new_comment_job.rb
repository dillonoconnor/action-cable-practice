class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("room_channel_#{message.room_id}", {content: message.content})
  end
end
