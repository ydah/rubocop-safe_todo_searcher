# frozen_string_literal: true

require 'thor'

module RuboCop
  module SafeTodoSearcher
    # Provide CLI sub-commands.
    class Cli < ::Thor
      default_command :annotate
      desc 'annotate', 'Run annotate search results.'
      option :only_safe, default: true, type: :boolean, aliases: '-a', desc: 'Only search safe autocorrectable cop.'
      def annotate
        Commands::Annotate.call
      end
    end
  end
end
