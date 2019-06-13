# requires all dependencies
Gem.loaded_specs['samvera-persona'].dependencies.each do |d|
  require d.name unless d.type == :development
 end
 
 require "samvera-persona/engine"

module Samvera
  module Persona
  end
end
