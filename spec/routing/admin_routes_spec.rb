require 'rails_helper'

RSpec.describe 'Samvera::Persona UsersController routes', type: :routing do

  it 'routes the persona users' do
    expect(get: persona_users_path).to route_to(controller: 'samvera/persona/users', action: 'index')
  end
end
