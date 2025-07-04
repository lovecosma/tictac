class Board < ApplicationRecord
  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 7]
  ]
  def play(move)
    if spaces[move[:space]].blank?
      spaces[move[:space]] = move[:token]
      save
    else
      raise 'Space already taken'
    end
  end

  def winner
    WINNING_COMBINATIONS.each do |combination|
      if combination.all? { |index| spaces[index] == 'X' }
        return 'X'
      elsif combination.all? { |index| spaces[index] == 'O' }
        return 'O'
      end
    end
    nil
  end

  def full?
    spaces.none? { |space| space.blank? }
  end
end
