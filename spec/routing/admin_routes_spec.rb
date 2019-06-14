require 'rails_helper'

RSpec.describe 'AdminController routes', type: :routing do
  routes { Samvera::Persona::Engine.routes }

  it 'routes the admin users' do
    expect(get: persona_users_path).to route_to(controller: 'samvera/persona/users', action: 'index')
  end
end
