# frozen_string_literal: true

require_relative 'rubocop/safe_todo_searcher/version'

module RuboCop
  module SafeTodoSearcher
    autoload :Cli, 'rubocop/safe_todo_searcher/cli'
    autoload :Commands, 'rubocop/safe_todo_searcher/commands'
  end
end
