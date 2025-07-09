class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @game.start! if @game.new?
  end

  def new
    @game = Game.new
    session[:game_id] = @game.id
    @game.start!
    redirect_to game_path @game
  end
end

