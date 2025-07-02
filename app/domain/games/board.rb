module Games
  class Board
    option :state, type: Types::Array.of(Types::String | Types::Nil), default: -> { Array.new(9) }
  def place_marker(position, marker)
      raise ArgumentError, "Position must be between 0 and 8" unless position.between?(0, 8)
      raise ArgumentError, "Marker must be 'X' or 'O'" unless %w(X O).include?(marker)

      if state[position].nil?
        state[position] = marker
      else
        raise "Position already taken"
      end
    end
  end
end