class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    redirect_to game_path @game
  end

  def update
    @game = Game.find(params[:id])
    @game.take_turn(game_params[:move])
    redirect_to game_path @game
  end

  private

  def game_params
    params.require(:game).permit(:move)
  end
end

