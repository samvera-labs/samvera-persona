$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "samvera-persona/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "samvera-persona"
  s.version     = Samvera::Persona::VERSION
  s.authors     = ["Rob Kaufman", "Lea Ann Bradford"]
  s.email       = ["support@notch8.com"]
  s.homepage    = "https://gitlab.com/notch8/samvera-persona"
  s.summary     = "Summary of Samvera::Persona."
  s.description = "Description of Samvera::Persona."
  s.license     = 'Apache-2.0'

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 5.1.1'
  s.add_dependency 'paranoia', '~> 2.2'
  s.add_dependency 'pretender'
  s.add_dependency 'devise', '~> 4.6'
  s.add_dependency 'devise_invitable', '~> 1.7'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'simplecov'
end
