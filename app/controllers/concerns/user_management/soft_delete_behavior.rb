module SamveraPersona
  module SoftDeleteBehavior
    extend ActiveSupport::Concern
    included do
      acts_as_paranoid
    end
  end
end