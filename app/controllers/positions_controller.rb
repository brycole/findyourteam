class PositionsController < ApplicationController
  before_action :set_team, only: %i[index new update create_default_positions delete_all_positions]

  def index
    @rooms = Room.where(team_id: @team.id)
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

  def create(position_name = "")
    # Team.find can't be in the before_action because we are using in the
    # create default positions method
    @team = Team.find(params[:team_id]) # dont remove

    @position = Position.new
    @position.team = @team
    if position_name == ""
      @position_name = PositionName.find(params[:position][:position_name])
    else
      @position_name = PositionName.find_by(name: position_name)
    end
    @position.position_name = @position_name
    @position.save

    redirect_to team_positions_path(@team.id) if position_name == ""
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    redirect_to team_positions_path(params[:team_id])
  end

  def clear_position
    redirect_to team_positions_path(@position.team_id)
  end

  def create_default_positions
    dota2 = %w[Carry Jungler Offlaner Support Support]
    csgo = %w[Leader Fragger AWPer Lurker Playmaker]
    @team.game_id == 1 ? game = dota2 : game = csgo
    game.each do |position_name|
      create(position_name)
    end

    redirect_to request.referrer
  end

  def delete_all_positions
    @team.positions.each(&:destroy)
    redirect_to request.referrer
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
