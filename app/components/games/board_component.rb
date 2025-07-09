# frozen_string_literal: true

module Games
  class BoardComponent < ViewComponent::Base
    extend Dry::Initializer
    include Turbo::FramesHelper
    option :game
    delegate :board, to: :game
  end
end
