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
require_relative 'safe_todo_searcher/version'

module RuboCop
  module SafeTodoSearcher
    module Commands
      class Annotate
        RUBOCOP_TODO_YML = '.rubocop_todo.yml'

        class << self
          def run
            puts generate_header
            puts horizontal_line
            puts generate_results
            puts horizontal_line
          end

          private

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
              header('RuboCop TODO searcher'),
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
  end
end
