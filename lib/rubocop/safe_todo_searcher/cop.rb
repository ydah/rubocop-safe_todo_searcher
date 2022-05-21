# frozen_string_literal: true

require 'rubocop'
require 'rubocop-minitest'
require 'rubocop-performance'
require 'rubocop-rails'
require 'rubocop-rake'
require 'rubocop-rspec'
require 'rubocop-sequel'

module RuboCop
  module SafeTodoSearcher
    class Cop
      def initialize(key:)
        @key = key
      end

      def instance
        const.new(config)
      end

      def const
        @const ||= Object.const_get(class_name)
      end

      private

      def name
        @key.first
      end

      def class_name
        "RuboCop::Cop::#{@key.first.gsub(%r{/}, '::')}"
      end

      def config
        @config ||= RuboCop::Config.new(default_config)
      end

      def default_config
        @default_config ||= RuboCop::ConfigLoader.default_configuration
      end
    end
  end
end
