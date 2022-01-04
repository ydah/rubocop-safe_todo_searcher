# frozen_string_literal: true

RSpec.describe Rubocop::SafeTodoSearcher do
  describe "version" do
    it "has a version number" do
      expect(Rubocop::SafeTodoSearcher::VERSION).not_to be nil
    end
  end
end
