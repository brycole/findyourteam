class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    redirect_to team_room_path(params[:room_message][:team_id], @room)
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
