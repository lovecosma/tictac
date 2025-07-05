class BoardsController < ApplicationController
  def update
    @game = Game.find(params[:game_id])
    begin 
      @game.take_turn(board_params)
    rescue StandardError => e
      flash[:error] = e.message
    end
    redirect_to game_path(@game)
  end


  private

  def board_params
    params.require(:board).permit(:value, :index)
  end
end
