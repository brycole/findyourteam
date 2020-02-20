class PositionNamesController < ApplicationController
  before_action :set_game
  def create
    @position_name = PositionName.new(position_name_params)
    @game = Game.find(params[:game_id])
    @position_name.game = @game
    @position_name.save
  end

  def index
    @position_names = PositionName.all
  end

  def destroy
    @position_name.delete
  end

  private

  def set_game
    @position_name = PositionName.find(params[:id])
  end

  def position_name_params
    params.require(:position_name).permit(:name)
  end
end
