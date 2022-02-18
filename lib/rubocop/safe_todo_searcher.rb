# frozen_string_literal: true

require "rubocop"
require "rubocop-minitest"
require "rubocop-performance"
require "rubocop-rails"
require "rubocop-rake"
require "rubocop-rspec"
require "rubocop-sequel"
require "yaml"
require_relative "safe_todo_searcher/version"

module Rubocop
  module SafeTodoSearcher
    RUBOCOP_TODO_YML = ".rubocop_todo.yml"

    class << self
      def search
        File.exist?(RUBOCOP_TODO_YML) ? parse : "#{RUBOCOP_TODO_YML} does not exist"
      end

      private

      def parse
        res = +""
        File.open(RUBOCOP_TODO_YML, "r") { |f| YAML.safe_load(f) }&.each_key do |key|
          res << "#{key}\n" if support_autocorrect?(key)
        end
        res
      end

      def support_autocorrect?(key)
        cop = Object.const_get "RuboCop::Cop::#{key.gsub(%r{/}, "::")}"
        cop.support_autocorrect? && cop.new(RuboCop::ConfigLoader.default_configuration).safe_autocorrect?
      rescue NameError
        false
      end
    end
  end
end
