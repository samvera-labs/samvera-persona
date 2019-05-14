module Hyrax
  class Admin::UsersController < ApplicationController
    include Hyrax::Admin::UsersControllerBehavior

    before_action :load_user, only: [:edit, :update, :destroy]

    # NOTE: User creation/invitations handled by devise_invitable

    # GET /admin/users/1/edit
    def edit
      #TODO - are we adding breadcrumbs conditionally here or are they added by the local app

      # add_breadcrumb t(:'hyrax.controls.home'), root_path
      # add_breadcrumb t(:'hyrax.admin.sidebar.users'), proprietor_users_path
      # add_breadcrumb @user.display_name, edit_proprietor_user_path(@user)
    end

    # PATCH/PUT admin/users/1
    # PATCH/PUT admin/users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
          # format.json { render :show, status: :ok #, location: [:proprietor, @user] }
        else
          format.html { render :edit }
          # format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
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
  end

end
