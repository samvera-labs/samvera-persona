module Hyrax
  class Admin::UsersController < ApplicationController
    include Hyrax::Admin::UsersControllerBehavior
    # before_action :require_admin!
    before_action :load_user, only: [:destroy]
    before_action :app_view_path
    # NOTE: User creation/invitations handled by devise_invitable

    # Become a user
    def impersonate
      user = User.find(params[:id])
      binding.pry
      impersonate_user(user)
      redirect_to root_path
    end
  
    def stop_impersonating
      stop_impersonating_user
      redirect_to admin_users_path, notice: 'Your "become" session is now over'
    end

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

    def app_view_path
      my_engine_root = UserManagement::Engine.root.to_s
      prepend_view_path "#{my_engine_root}/app/views/#{Rails.application.class.parent_name.downcase}"
    end

  end

end
