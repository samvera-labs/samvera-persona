$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_management"
  s.version     = UserManagement::VERSION
  s.authors     = ["Rob Kaufman", "Lea Ann Bradford"]
  s.email       = ["support@notch8.com"]
  #s.homepage    = "TODO"
  #s.summary     = "TODO: Summary of UserManagement."
  #s.description = "TODO: Description of UserManagement."
  s.homepage    = "https://gitlab.com/notch8/avalon-user-management"
  s.summary     = "Summary of Samvera::Devise::Auth."
  s.description = "Description of Samvera::Devise::Auth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 5.1.1'
  s.add_dependency 'pretender'

  s.add_development_dependency 'sqlite3', '~> 1.3.6'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_bot_rails'
end
