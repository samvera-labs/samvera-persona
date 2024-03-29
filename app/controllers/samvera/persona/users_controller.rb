module Samvera
  class Persona::UsersController < ApplicationController
    # include Hyrax based theme and admin only connection
    begin
      if defined?(Avalon)
        include Samvera::Persona::AvalonAuth
      end
      include Hyrax::Admin::UsersControllerBehavior
    rescue NameError
      before_action :authenticate_user!
    end

    before_action :load_user, only: [:edit, :update, :destroy]
    before_action :app_view_path
    # NOTE: User creation/invitations handled by devise_invitable
    def index
      # Hyrax derivitives have breadcrumbs, Avalon does not
      if defined?(add_breadcrumb)
        add_breadcrumb t(:'hyrax.controls.home'), main_app.root_path
        add_breadcrumb t(:'hyrax.dashboard.breadcrumbs.admin'), hyrax.dashboard_path
        add_breadcrumb t(:'samvera.persona.users.index.title'), main_app.persona_users_path
      end

      @presenter = Samvera::Persona::UsersPresenter.new
    end

    # GET /persona/users/1/edit
    def edit
      # Hyrax derivitives have breadcrumbs, Avalon does not
      if defined?(add_breadcrumb)
        add_breadcrumb t(:'hyrax.controls.home'), main_app.root_path
        add_breadcrumb t(:'hyrax.admin.sidebar.users'), main_app.persona_users_path
        add_breadcrumb @user.display_name, main_app.edit_persona_user_path(@user)
      end
    end

    # PATCH/PUT persona/users/1
    # PATCH/PUT persona/users/1.json
    def update
      # required for settings form to submit when password is left blank
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update(user_params)
          @user.save

          format.html { redirect_to main_app.persona_users_path, notice: 'User was successfully updated.' }#move to locales
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
      redirect_to main_app.root_path
    end

    def stop_impersonating
      stop_impersonating_user
      redirect_to main_app.persona_users_path, notice: t('.become.over')
    end

    # Delete a user from the site
    def destroy
      #TODO update hyku user.destroy to do roles.destroy_all instead
      if @user.present? && @user.destroy
        redirect_to main_app.persona_users_path, notice: t('.success', user: @user)
      else
        redirect_to main_app.persona_users_path flash: { error: t('.failure', user: @user) }
      end
    end

    private

    def load_user
      if User.respond_to?(:from_url_component)
        @user = User.from_url_component(params[:id])
      else
        @user = User.find(params[:id])
      end
    end

    def app_view_path
      my_engine_root = Samvera::Persona::Engine.root.to_s
      prepend_view_path "#{my_engine_root}/app/views/#{Rails.application.class.module_parent_name.downcase}"
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :is_superadmin, :facebook_handle, :twitter_handle, :googleplus_handle, :display_name, :address, :department, :title, :office, :chat_id, :website, :affiliation, :telephone, :avatar, :group_list, :linkedin_handle, :orcid, :arkivo_token, :arkivo_subscription, :zotero_token, :zotero_userid, :preferred_locale, role_ids: [])
    end
  end
end
