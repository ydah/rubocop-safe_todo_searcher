# frozen_string_literal: true

require_relative 'safe_todo_searcher/version'

module RuboCop
  module SafeTodoSearcher
    autoload :Cli, 'rubocop/safe_todo_searcher/cli'
    autoload :Commands, 'rubocop/safe_todo_searcher/commands'
    autoload :Searcher, 'rubocop/safe_todo_searcher/searcher'
  end
end
