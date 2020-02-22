class PositionsController < ApplicationController
  before_action :set_team, only: %i[index new create]
  skip_before_action :authenticate_user!

  def index
    @positions = Position.where(team_id: @team)
  end

  def new
    @position_names = PositionName.where(game_id: @team.game)
    @position = Position.new
  end

  def create
    @position = Position.new
    @position.team = @team
    @position_name = PositionName.find(params[:position][:position_name])
    @position.position_name = @position_name
    @position.save

    redirect_to team_positions_path(@team.id)
  end

  def destroy
    @position = Position.find(params[:id])
    @position.delete

    redirect_to team_positions_path(params[:team_id])
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
