module Samvera
  module Persona
    module UsernameBehavior 
      extend ActiveSupport::Concern
      included do
        before_create :check_for_mandatory
      end

      def check_for_mandatory
        if self.respond_to?(:username)
          if self.email.present? && self.username.blank?
            self.username = self.email
          end
        end

        if self.respond_to?(:uid)
          if self.email.present? && self.uid.blank?
            self.uid = self.email
          end
        end

        true
      end
    end
  end
end
