module Hyrax
  class Admin::UsersController < ApplicationController
    include Hyrax::Admin::UsersControllerBehavior

    before_action :load_user, only: [:destroy]

    # NOTE: User creation/invitations handled by devise_invitable

    # Delete a user from the site
    def destroy
      #TODO update hyku user.destroy to do roles.destroy_all instead
      if @user.present? && @user.destroy
        redirect_to admin_users_path, notice: t('hyrax.admin.users.destroy.success', user: @user)
      else
        redirect_to admin_users_path flash: { error: t('hyrax.admin.users.destroy.failure', user: @user) }
      end
    end

    private

    def load_user
      @user = User.find(params[:id])
    end
  end

end
