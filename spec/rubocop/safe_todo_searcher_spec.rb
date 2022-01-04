# frozen_string_literal: true

RSpec.describe Rubocop::SafeTodoSearcher do
  describe "version" do
    it "has a version number" do
      expect(Rubocop::SafeTodoSearcher::VERSION).not_to be nil
    end
  end

  describe "support_autocorrect?" do
    context "auto-correct is supported" do
      it "returns true" do
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Bundler/OrderedGems")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Gemspec/DateAssignment")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Layout/AccessModifierIndentation")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Lint/AmbiguousOperatorPrecedence")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Migration/DepartmentName")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Naming/BinaryOperatorParameterName")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Security/YAMLLoad")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Style/AccessorGrouping")).to be true
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Rails/ActionFilter")).to be true
      end
    end

    context "auto-correct is not supported" do
      it "returns false" do
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Bundler/DuplicatedGem")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Layout/EndOfLine")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Lint/AmbiguousAssignment")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Naming/AccessorMethodName")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Security/Eval")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Style/AccessModifierDeclarations")).to be false
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Rails/AfterCommitOverride")).to be false
      end
    end

    context "nonexistent cops" do
      it "returns false" do
        expect(Rubocop::SafeTodoSearcher.support_autocorrect?("Invalid/NonExistentCops")).to be false
      end
    end
  end
end
