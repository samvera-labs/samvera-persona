# requires all dependencies
Gem.loaded_specs['samvera_persona'].dependencies.each do |d|
  require d.name unless d.type == :development
 end
 
 require "samvera_persona/engine"

module SamveraPersona
  
end
