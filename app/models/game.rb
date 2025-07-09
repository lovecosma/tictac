class Game < ApplicationRecord
  include AASM
  PLAYERS = %w(X O)

  attr_accessor :current_player

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

  def take_turn(index:, current_player:)
    @current_player = current_player
    play(index)
    if won?
      finish!
    elsif draw?
      draw!
    end
  end

  def next_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
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

  def play(index)
    board[index] = current_player
    save
  end

  def current_player
    @current_player ||= PLAYERS.first
  end
end
