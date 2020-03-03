class PlayersController < ApplicationController
  def show
    @player = User.find(params[:id])

  def index
    # @players = User.all

    if params[:query].present?
      sql_query = "nickname ILIKE :query OR show_game ILIKE :query OR email ILIKE :query"
      @players = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @players = User.all
    end
  end

end
