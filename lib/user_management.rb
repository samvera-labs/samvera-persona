# requires all dependencies
Gem.loaded_specs['user_management'].dependencies.each do |d|
  require d.name unless d.type == :development
 end
 
 require "user_management/engine"

module UserManagement
  
end
