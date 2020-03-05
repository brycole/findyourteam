class PlayersController < ApplicationController
  def show
    @player = User.find(params[:id])
  end

  def index
    # @players = User.all

    if params[:query].present?
      sql_query = "nickname ILIKE :query OR show_game ILIKE :query OR email ILIKE :query"
      @players = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @players = User.all
    end
  end

  def ranks
    @ranks = Rank.all
    @dota2 = Rank.where(game_id: 1)
    @cs = Rank.where(game_id: 2)
  end
end
