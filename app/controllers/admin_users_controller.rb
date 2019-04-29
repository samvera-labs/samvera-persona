class AdminUsersController < ApplicationController
  extend ActiveSupport::Concern
  # include Blacklight::SearchContext
  included do
    # before_action :ensure_admin!
    # with_themed_layout 'dashboard'
  end

  # Display admin menu list of users
  def index
    # add_breadcrumb t(:'user_management.controls.home'), root_path
    # add_breadcrumb t(:'user_management.dashboard.breadcrumbs.admin'), hyrax.dashboard_path
    # add_breadcrumb t(:'user_management.admin.users.index.title'), admin_users_path
    # @presenter = AdminUsersPresenter.new

    # @users ||= search


  end

  private

    def ensure_admin!
      authorize! :read, :admin_dashboard
    end
end
