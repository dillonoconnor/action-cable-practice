class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @message = Message.new
    @room = Room.find(params[:id])
  end
end
