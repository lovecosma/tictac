class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def new
    return redirect_to game_path session[:game_id] if session[:game_id].present?
    @game = Game.new
    @game.start!
    session[:game_id] = @game.id
    redirect_to game_path @game
  end

  def update
    @game = Game.find(params[:id])
    @game.take_turn(game_params)
    redirect_to game_path @game
  end

  private

  def game_params
    params.require(:game).permit(:value, :index)
  end
end

