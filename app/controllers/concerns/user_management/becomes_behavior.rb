
module UserManagement
  module BecomesBehavior
    extend ActiveSupport::Concern
    included do
      impersonates :user
    end
  end
end