# frozen_string_literal: true

require_relative 'safe_todo_searcher/version'

module RuboCop
  module SafeTodoSearcher
    autoload :Analysis, 'rubocop/safe_todo_searcher/analysis'
    autoload :Cli, 'rubocop/safe_todo_searcher/cli'
    autoload :Cop, 'rubocop/safe_todo_searcher/cop'
    autoload :Commands, 'rubocop/safe_todo_searcher/commands'
    autoload :Searcher, 'rubocop/safe_todo_searcher/searcher'
  end
end
