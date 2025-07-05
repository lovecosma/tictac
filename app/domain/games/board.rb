# frozen_string_literal: true
module Games
  class Board
    extend Dry::Initializer
    option :cells, default: -> { Array.new(9, nil) }

  end
end
