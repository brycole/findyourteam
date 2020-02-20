class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    @game = Game.new
    @game.save
  end
end
