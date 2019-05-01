RSpec.describe 'Admin Routes', type: :routing do
  routes { UserManagement::Engine.routes }

  it 'routes the admin users' do
    expect(get: '/admin/users').to route_to(controller: 'hyrax/admin/users', action: 'index')
  end
end