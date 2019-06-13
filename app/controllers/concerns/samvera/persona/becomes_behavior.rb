module Samvera
  module Persona
    module BecomesBehavior
      extend ActiveSupport::Concern
      included do
        impersonates :user
      end
    end
  end
end