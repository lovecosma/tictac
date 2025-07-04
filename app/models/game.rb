class Game < ApplicationRecord
  include AASM
  PLAYERS = %w(X O)

  aasm column: :state  do
    state :new
    state :in_progress
    state :finished
    state :abandoned
    state :draw

    event :start do
      transitions from: :new, to: :in_progress
    end
    event :finish do
      transitions from: :in_progress, to: :finished
    end
    event :abandon do
      transitions from: [:new, :in_progress], to: :abandoned
    end
    event :draw do
      transitions from: :in_progress, to: :draw
    end
  end

  def take_turn(move)
    @board.play(move)
    if won?
      finish
    elsif @board.full?
      draw
    end
    next_player!
  end

  def won?
    @board.winner.present?
  end

  def next_player!
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def current_player
    @current_player ||= PLAYERS.first
  end
end
