source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in samvera-persona.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
gem 'byebug', group: [:development, :test]
gem 'rails-controller-testing', group: [:development, :test]

# Rails 7.2 updates the ActiveRecord adapter to require sqlite3 version 2
if ENV['RAILS_VERSION'].to_f < 7.2
  gem 'rails', ENV['RAILS_VERSION']
  gem 'sqlite3', '~> 1.0', group: [:development]
elsif ENV['RAILS_VERSION'].to_f >= 7.2
  gem 'rails', ENV['RAILS_VERSION']
  gem 'sqlite3', '~> 2.0', group: [:development]
else
  gem 'rails', '>= 5.2.4.3', '< 8'
  gem 'sqlite3', '~> 2.0', group: [:development]
end