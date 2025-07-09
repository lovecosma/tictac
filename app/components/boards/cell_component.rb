# frozen_string_literal: true

module Boards
  class CellComponent < ViewComponent::Base
    extend Dry::Initializer
    option :game
    option :index
    option :value
  end
end

