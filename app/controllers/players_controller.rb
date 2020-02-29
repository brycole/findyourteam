class PlayersController < ApplicationController


  def show
    @players = User.all
  end
end
