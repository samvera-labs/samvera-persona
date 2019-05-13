require 'rails_helper'

RSpec.describe 'AdminController routes', type: :routing do
  # routes { UserManagement::Engine.routes }

  it 'routes the admin users' do
    expect(get: admin_users_path).to route_to(controller: 'hyrax/admin/users', action: 'index')
  end
end