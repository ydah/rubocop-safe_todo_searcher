# frozen_string_literal: true

RSpec.describe RuboCop::SafeTodoSearcher do
  describe 'version' do
    it 'has a version number' do
      expect(RuboCop::SafeTodoSearcher::VERSION).not_to be_nil
    end
  end
end
