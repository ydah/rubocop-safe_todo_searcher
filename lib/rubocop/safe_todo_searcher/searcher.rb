# frozen_string_literal: true

require 'rubocop'
require 'rubocop-minitest'
require 'rubocop-performance'
require 'rubocop-rails'
require 'rubocop-rake'
require 'rubocop-rspec'
require 'rubocop-sequel'
require 'date'
require 'highline'
require 'yaml'

module RuboCop
  module SafeTodoSearcher
    class Searcher
      class << self
        # @param [String] source_path
        # @return [Hash, nil]
        def call(only_safe:)
          new(only_safe:).call
        end
      end

      def initialize(only_safe:)
        @only_safe = only_safe
      end

      # @return [Hash, nil]
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
          "#{key}\n" if support_autocorrect?(key)
        end&.compact
      end

      def support_autocorrect?(key)
        cop = Object.const_get "RuboCop::Cop::#{key.gsub(%r{/}, '::')}"
        cop.support_autocorrect? && cop.new(RuboCop::ConfigLoader.default_configuration).safe_autocorrect?
      rescue NameError
        false
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
