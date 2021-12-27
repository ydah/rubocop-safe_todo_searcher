# frozen_string_literal: true

require_relative "lib/rubocop/safe_todo_searcher/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-safe_todo_searcher"
  spec.version = Rubocop::SafeTodoSearcher::VERSION
  spec.authors = ["ydah\n\n"]
  spec.email = ["13041216+ydah@users.noreply.github.com"]

  spec.summary = "Check if Cop auto correct is available in .rubocop_todo.yml."
  spec.description = "Search for Cops that can be automatically modified among the Cops listed in .rubocop_todo.yml."
  spec.homepage = "https://github.com/ydah/rubocop-safe_todo_searcher"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ydah/rubocop-safe_todo_searcher"
  spec.metadata["changelog_uri"] = "https://github.com/ydah/rubocop-safe_todo_searcher/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
