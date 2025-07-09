module GamesHelper
  def current_player
      session[:current_player] || Game::PLAYERS.first
    end
end
