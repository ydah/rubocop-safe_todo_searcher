# frozen_string_literal: true

require_relative 'lib/rubocop/safe_todo_searcher/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-safe_todo_searcher'
  spec.version = RuboCop::SafeTodoSearcher::VERSION
  spec.authors = ['ydah']
  spec.email = ['t.yudai92@gmail.com']

  spec.summary = 'Check if Cop auto correct is available in .rubocop_todo.yml.'
  spec.description = 'Search for Cops that can be automatically modified among the Cops listed in .rubocop_todo.yml.'
  spec.homepage = 'https://github.com/ydah/rubocop-safe_todo_searcher'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ydah/rubocop-safe_todo_searcher'
  spec.metadata['changelog_uri'] = 'https://github.com/ydah/rubocop-safe_todo_searcher/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-minitest'
  spec.add_dependency 'rubocop-performance'
  spec.add_dependency 'rubocop-rails'
  spec.add_dependency 'rubocop-rake'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubocop-sequel'
  spec.add_dependency 'thor'
  spec.add_dependency 'yard'
end
