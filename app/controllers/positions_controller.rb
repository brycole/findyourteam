class PositionsController < ApplicationController
  before_action :set_team, only: %i[index new create update]
  skip_before_action :authenticate_user!

  def index
    @positions = Position.where(team_id: @team).order(id: :desc)
    @applied = []

    user_applications = PendingApplication.where(user_id: current_user)

    user_applications.each do |user|
      @applied << user.position_id
    end
  end

  def all
    @positions = Position.all
  end

  def update
    @position = Position.find(params[:id])
    @position.user = nil
    @position.save
    redirect_to request.referrer
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
    @position.destroy

    redirect_to team_positions_path(params[:team_id])
  end

  def clear_position
    redirect_to team_positions_path(@position.team_id)
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
