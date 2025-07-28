# frozen_string_literal: true

module Boards
  class BoardComponent < ViewComponent::Base
    extend Dry::Initializer
    include Turbo::FramesHelper
    option :board


    def cell_data(index)
      { action: "click->games#play", games_index_value: index }
    end
  end
end
