# frozen_string_literal: true

module RuboCop
  module SafeTodoSearcher
    module Commands
      class Annotate
        class << self
          # @param [Boolean] only_safe
          def call(only_safe:)
            new(only_safe:).call
          end
        end

        def initialize(only_safe:)
          @only_safe = only_safe
        end

        def call
          Searcher.call(only_safe: @only_safe)
        end
      end
    end
  end
end
