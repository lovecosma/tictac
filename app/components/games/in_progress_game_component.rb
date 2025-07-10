# frozen_string_literal: true

module Games
  class InProgressGameComponent < ViewComponent::Base
    extend Dry::Initializer
    option :game
  end
end
