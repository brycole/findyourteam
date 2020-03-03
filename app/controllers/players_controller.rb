class PlayersController < ApplicationController


  def show
    @players = User.all
  end

  def ranks
    @ranks = Rank.all
    @dota2 = Rank.where(game_id: 1)
    @cs = Rank.where(game_id: 2)
  end
end
