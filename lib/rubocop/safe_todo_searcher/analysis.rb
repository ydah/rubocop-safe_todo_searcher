# frozen_string_literal: true

module RuboCop
  module SafeTodoSearcher
    module Analysis
      def support_autocorrect?(cop:, only_safe:)
        cop.const.support_autocorrect? && safe_autocorrect?(cop, only_safe)
      rescue NameError
        false
      end

      private

      def safe_autocorrect?(cop, only_safe)
        return true unless only_safe

        cop.instance.safe_autocorrect?
      end
    end
  end
end
