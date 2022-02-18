# frozen_string_literal: true

require "rubocop"
require "rubocop-rails"
require "yaml"
require_relative "safe_todo_searcher/version"

module Rubocop
  module SafeTodoSearcher
    class << self
      def search
        File.exist?(".rubocop_todo.yml") ? parse : "rubocop_todo.yml does not exist"
      end

      def parse
        res = +""
        File.open(".rubocop_todo.yml", "r") { |f| YAML.safe_load(f) }.each_key do |key|
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
