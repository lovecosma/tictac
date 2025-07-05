# frozen_string_literal: true

class BoardComponent < ViewComponent::Base
  extend Dry::Initializer
  option :game
  delegate :board, to: :game
end
