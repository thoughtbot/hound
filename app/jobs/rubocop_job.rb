class RubocopJob < ApplicationJob
  sidekiq_options queue: :rubocop
end
