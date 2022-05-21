# frozen_string_literal: true

require 'date'
require 'highline'
require 'yaml'

module RuboCop
  module SafeTodoSearcher
    class Searcher
      include Analysis

      class << self
        def call(only_safe:)
          new(only_safe:).call
        end
      end

      def initialize(only_safe:)
        @only_safe = only_safe
      end

      def call
        puts generate_header
        puts horizontal_line
        puts generate_results
        puts horizontal_line
      end

      private

      RUBOCOP_TODO_YML = '.rubocop_todo.yml'

      def generate_results
        File.exist?(RUBOCOP_TODO_YML) ? parse : "#{RUBOCOP_TODO_YML} does not exist"
      end

      def parse
        File.open(RUBOCOP_TODO_YML, 'r') { |f| YAML.safe_load(f) }&.map do |key|
          cop = Cop.new(key:)
          "#{key.first}\n" if support_autocorrect?(cop:, only_safe: @only_safe)
        end&.compact
      end

      def generate_header
        [
          horizontal_line,
          header('Rubocop TODO searcher'),
          title('Version', RuboCop::SafeTodoSearcher::VERSION),
          title('Date', DateTime.now.strftime('%Y-%m-%d %H:%M:%S'))
        ]
      end

      def header(text)
        HighLine.new.color("++++++ #{text} ++++++", :bold)
      end

      def title(title, value, color = :green)
        "#{HighLine.new.color(title, color)}: #{value}"
      end

      def horizontal_line(color = :none)
        HighLine.new.color('--------------------------------------------------', :bold, color)
      end
    end
  end
end
