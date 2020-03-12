class RoomsController < ApplicationController
  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :load_entities

  def show
    @team = Team.find(params[:team_id])
    @room_message = RoomMessage.new(room: @room)
    @room_messages = @room.room_messages.includes(:user)
  end

  def new
    @team = Team.find(params[:team_id])
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    @team = Team.find(params[:team_id])
    @room.team = @team

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to team_positions_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to team_positions_path(params[:team_id])
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
