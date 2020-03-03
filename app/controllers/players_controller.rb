class PlayersController < ApplicationController
  def show
    @player = User.find(params[:id])
  end
end
