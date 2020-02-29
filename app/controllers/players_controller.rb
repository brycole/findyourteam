class PlayersController < ApplicationController
  def show
    @player = current_user
  end
end
