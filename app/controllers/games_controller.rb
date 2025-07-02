class GamesController < ApplicationController
  def new
    @player_one = Player.new(token: 'X')
    @player_two = Player.new(token: 'O')
    players = [@player_one, @player_two]
    @board = Board.new(players:)
    @game = Game.new(board:)
  end
end
