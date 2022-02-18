# frozen_string_literal: true

require "rubocop"
require "rubocop-minitest"
require "rubocop-performance"
require "rubocop-rails"
require "rubocop-rake"
require "rubocop-rspec"
require "rubocop-sequel"
require "date"
require "highline"
require "yaml"
require_relative "safe_todo_searcher/version"

module Rubocop
  module SafeTodoSearcher
    class << self
      def search
        puts generate_header
        puts horizontal_line
        puts generate_results
        puts horizontal_line
      end

      private

      def generate_results
        File.exist?(".rubocop_todo.yml") ? parse : "rubocop_todo.yml does not exist"
      end

      def parse
        res = +""
        File.open(".rubocop_todo.yml", "r") { |f| YAML.safe_load(f) }&.each_key do |key|
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

      def generate_header
        [
          horizontal_line,
          header("Rubocop TODO searcher"),
          title("Version", Rubocop::SafeTodoSearcher::VERSION),
          title("Date", DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
        ]
      end

      def header(text)
        HighLine.new.color("++++++ #{text} ++++++", :bold)
      end

      def title(title, value, color = :green)
        "#{HighLine.new.color(title, color)}: #{value}"
      end

      def horizontal_line(color = :none)
        HighLine.new.color("--------------------------------------------------", :bold, color)
      end
    end
  end
end
