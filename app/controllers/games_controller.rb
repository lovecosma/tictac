class GamesController < ApplicationController
	X = 'X'.freeze
	O = 'O'.freeze
	def new
		@board = Board.create
		session[:current_player] = X
	end
end
