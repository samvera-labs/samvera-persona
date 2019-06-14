module Samvera
  module Persona
    class UsersPresenter
      # @return [Array] an array of Users
      def users
        @users ||= search
      end

      # @return [Number] quantity of users excluding the system users and guest_users
      def user_count
        users.count
      end

      # @return [Array] an array of user roles
      def user_roles(user)
        user.groups
      end

      def last_accessed(user)
        user.respond_to?(:last_sign_in_at) && user.last_sign_in_at ? user.last_sign_in_at : user.created_at
      end

      # return [Boolean] true if the devise trackable module is enabled.
      def show_last_access?
        return @show_last_access unless @show_last_access.nil?
        @show_last_access = ::User.devise_modules.include?(:trackable)
      end

      private

        # Returns a list of users excluding the system users and guest_users
      def search
        if ::User.respond_to?(:registered)
          ::User.registered.without_system_accounts
        else
          ::User.all
        end
      end
    end
  end
end
