class Game < ApplicationRecord
  include AASM
  PLAYERS = %w(X O)

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [0, 4, 8],
    [2, 4, 6],
    [2, 5, 8]
  ]

  aasm column: :state  do
    state :new
    state :in_progress
    state :finished
    state :draw

    event :start do
      transitions from: :new, to: :in_progress
    end
    event :finish do
      transitions from: :in_progress, to: :finished
    end
    event :draw do
      transitions from: :in_progress, to: :draw
    end
  end

  def take_turn(play_args)
    play(**play_args)
    if won?
      finish!
    elsif draw?
      draw!
    end
    next_player!
  end

  def next_player!
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def current_player
    @current_player ||= PLAYERS.first
  end

  def won?
    winner.present?
  end

  def winner
    WINNING_COMBINATIONS.each do |combination|
      if combination.all? { |index| board[index] == 'X' }
        return 'X'
      elsif combination.all? { |index| board[index] == 'O' }
        return 'O'
      end
    end
    nil
  end

  def draw
    board.all? { |cell| cell.present? }
  end

  def play(value:, index:)
    raise 'Invalid move' unless board[index].blank? && index >= 0 && index <= 8
    board[index] = value
    save
  end
end
