class PlayersController < ApplicationController


  def show
    @players = User.all
  end

  def ranks
    @ranks = Rank.all
  end
end
