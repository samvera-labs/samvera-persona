module Samvera
  module Persona
    module AvalonAuth
      extend ActiveSupport::Concern
      included do
        before_action :auth
      end

      def auth
        if current_user.nil?
          flash[:notice] = "You need to login to manage users"
          redirect_to main_app.new_user_session_path
        elsif cannot? :manage, User
          flash[:notice] = "You do not have permission to manage users"
          redirect_to main_app.root_path
        end
      end
    end
  end
end
