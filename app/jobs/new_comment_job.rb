class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(**args)
    ActionCable.server.broadcast("room_channel_#{args.room}", {content: args.message})
  end
end
