class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_team, only: %i[show edit destroy update]

  def index
    @teams = Team.where(game_id: params[:game_id])
  end

  def show
  end

  def new
    @game = Game.find(params[:game_id])
    @team = Team.new
  end

  def create
   @team = Team.new(team_params)

    if @team.save!
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update(team_params)
    redirect_to teams_path
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :user_id, :game_id)
  end
end
