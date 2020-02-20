class GamesController < ApplicationController
    before_action :set_game

  def index
   @games = Game.all
  end

  def create
   @game = Game.new(game_params)
   @game.save
  end

private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(%i[title genre])
  end

end
