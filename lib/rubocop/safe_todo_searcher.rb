# frozen_string_literal: true

require "rubocop"
require "rubocop-rails"
require "yaml"
require_relative "safe_todo_searcher/version"

module Rubocop
  module SafeTodoSearcher
    class Error < StandardError; end
    @result = +""

    def self.search
      if File.exist?(".rubocop_todo.yml")
        File.open(".rubocop_todo.yml", "r") { |f| YAML.safe_load(f) }.each_key do |key|
          @result << "#{key}\n" if support_autocorrect?(key)
        end
        @result
      else
        "rubocop_todo.yml does not exist"
      end
    end

    def self.support_autocorrect?(key)
      klass = Object.const_get "RuboCop::Cop::#{key.gsub(%r{/}, "::")}"
      klass.support_autocorrect?
    rescue NameError
      false
    end
  end
end
