require "rubocop"
require "rubocop-rails"
require "yaml"
require_relative "safe_todo_searcher/version"

module Rubocop
  module SafeTodoSearcher
    class Error < StandardError; end

    def self.search
      if File.exist?(".rubocop_todo.yml")
        res = ""
        open(".rubocop_todo.yml", "r") { |f| YAML.safe_load(f) }.each_key do |key|
          klass = Object.const_get "RuboCop::Cop::#{key.gsub(%r{/}, "::")}"
          res << "#{key}\n" if klass.support_autocorrect?
        rescue StandardError
          nil
        end
        res
      else
        "rubocop_todo.yml does not exist"
      end
    end
  end
end
