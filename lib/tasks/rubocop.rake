# frozen_string_literal: true
# Adds the following rake tasks
# rake rubocop
# rake rubocop:auto_correct
unless Rails.env.production?
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
end
