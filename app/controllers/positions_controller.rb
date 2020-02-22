class PositionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @team = Team.find(params[:team_id])
    @positions = Position.all
  end

  def new
    @team = Team.find(params[:team_id])
    @position_names = PositionName.where(game_id: @team.game)
    @position = Position.new
  end

  def create
    @position = Position.new
    @team = Team.find(params[:team_id])
    @position.team = @team
    @position_name = PositionName.find(params[:position][:position_name])
    @position.position_name = @position_name
    @position.save

    redirect_to team_positions_path(@team.id)
  end

  def edit
    @position = Position.find()
  end

  def destroy
    @position = Position.find(params[:id])
    @position.delete

    redirect_to team_positions_path(params[:team_id])
  end
end
