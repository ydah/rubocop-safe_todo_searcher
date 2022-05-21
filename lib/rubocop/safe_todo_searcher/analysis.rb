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
    module Analysis
      def support_autocorrect?(key:, only_safe:)
        cop = const_get(key)
        cop.support_autocorrect? && safe_autocorrect?(key, cop, only_safe)
      rescue NameError
        false
      end

      private

      def const_get(key)
        Object.const_get("RuboCop::Cop::#{key.first.gsub(%r{/}, '::')}")
      end

      def default_config(key)
        RuboCop::ConfigLoader.default_configuration[(key.first.gsub(%r{/}, '::'))]
      end

      def safe_autocorrect?(key, cop, only_safe)
        return true unless only_safe

        cop.new(default_config(key)).safe_autocorrect?
      end
    end
  end
end
