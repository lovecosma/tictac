require 'rails_helper'

describe GamesController, type: :request do
  describe "GET #show" do
    it "returns a successful response" do
      game = Game.create!
      get "/games/#{game.id}"
      expect(response).to be_successful
    end
  end
end
