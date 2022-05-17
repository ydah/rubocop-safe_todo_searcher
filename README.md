# RuboCop SafeTodoSearcher [![CI](https://github.com/ydah/rubocop-safe_todo_searcher/actions/workflows/ci.yml/badge.svg)](https://github.com/ydah/rubocop-safe_todo_searcher/actions/workflows/ci.yml) [![Gem Version](https://badge.fury.io/rb/rubocop-safe_todo_searcher.svg)](https://badge.fury.io/rb/rubocop-safe_todo_searcher) [![Maintainability](https://api.codeclimate.com/v1/badges/38a1dd096ef8135421af/maintainability)](https://codeclimate.com/github/ydah/rubocop-safe_todo_searcher/maintainability)

Search `rubocop_todo.yml` to see if there are any cop that can be resolved with auto correct.  
If you want to know if the pending remarks in your `rubocop_todo.yml `can be deleted automatically, please use it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-safe_todo_searcher'
```

And then execute:

```
bundle install
```

## Usage

After installation, run the following on the command line.

```
bundle exec rubocop-safe_todo_searcher
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Test it (`rake spec`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Send a pull request :)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RuboCop::SafeTodoSearcher project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ydah/rubocop-safe_todo_searcher/blob/master/CODE_OF_CONDUCT.md).
