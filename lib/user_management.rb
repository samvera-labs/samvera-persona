# requires all dependencies
Gem.loaded_specs['user_management'].dependencies.each do |d|
  require d.name unless d.type == :development
 end
 
 require "user_management/engine"

module UserManagement
  # class Engine < ::Rails::Engine
  #   isolate_namespace UserManagement
  # end
  # Your code goes here...
end
