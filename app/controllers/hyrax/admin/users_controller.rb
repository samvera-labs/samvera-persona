module Hyrax
  class Admin::UsersController < ApplicationController
    include Hyrax::Admin::UsersControllerBehavior
    # before_action :require_admin!
    # before_action :ensure_admin!
    before_action :load_user, only: [:edit, :update, :destroy]
    before_action :app_view_path
    # NOTE: User creation/invitations handled by devise_invitable

    # GET /admin/users/1/edit
    def edit
      #TODO - are we adding breadcrumbs conditionally here or are they added by the local app
      # Breadcrumbs only need to be added to hyku views
      # add_breadcrumb t(:'hyrax.controls.home'), root_path
      # add_breadcrumb t(:'hyrax.admin.sidebar.users'), proprietor_users_path
      # add_breadcrumb @user.display_name, edit_proprietor_user_path(@user)
    end

    # PATCH/PUT admin/users/1
    # PATCH/PUT admin/users/1.json
    def update      
      # required for settings form to submit when password is left blank
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update_attributes(user_params)
          @user.save
          
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }#move to locales
          format.json { render :show, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # Become a user
    def impersonate
      user = User.find(params[:id])
      impersonate_user(user)
      redirect_to root_path
    end
  
    def stop_impersonating
      stop_impersonating_user
      redirect_to admin_users_path, notice: t('hyrax.admin.users.become.over')
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
      my_engine_root = SamveraPersona::Engine.root.to_s
      prepend_view_path "#{my_engine_root}/app/views/#{Rails.application.class.parent_name.downcase}"
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)#, :is_superadmin, :facebook_handle, :twitter_handle, :googleplus_handle, :display_name, :address, :department, :title, :office, :chat_id, :website, :affiliation, :telephone, :avatar, :group_list, :linkedin_handle, :orcid, :arkivo_token, :arkivo_subscription, :zotero_token, :zotero_userid, :preferred_locale, role_ids: [])
    end
  end
end
