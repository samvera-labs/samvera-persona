# requires all dependencies
Gem.loaded_specs['samvera-persona'].dependencies.each do |d|
  require d.name unless d.type == :development
end
 
require "samvera-persona/engine"

module Samvera
  module Persona
    mattr_accessor :soft_delete
    self.soft_delete = true

    def self.setup
      yield self
    end
  end
end
