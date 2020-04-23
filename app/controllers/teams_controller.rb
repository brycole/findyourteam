class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :set_user_team]
  before_action :set_team, only: %i[show edit destroy update]

  def index
    if current_user.nil?
      @teams = Team.all
    else
      if params[:query].present?
        sql_query = "name ILIKE :query"
        @teams = Team.where(sql_query, query: "%#{params[:query]}%")
      else
        @teams = Team.where(game_id: current_user.show_game)
      end
    end
  end

  def set_user_team
    unless current_user.nil?
      current_user.show_game = params[:game]
      current_user.save
    end
    redirect_to teams_path
  end

  def show
  end

  def new
    @game = Game.find(current_user.show_game)
    @team = Team.new
  end

  def create
    @game = Game.find(current_user.show_game)
    @team = Team.new(team_params)
    @team.game = @game

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
    params.require(:team).permit(:name, :user_id, :game_id, :photo)
  end
end
