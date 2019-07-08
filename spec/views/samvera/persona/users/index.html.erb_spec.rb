require 'rails_helper' 

RSpec.describe 'samvera/persona/users/index.html.erb', type: :view do
  let(:presenter) { Samvera::Persona::UsersPresenter.new }
  let(:users) { 4.times.map { FactoryBot.create(:user) } +
                2.times.map { FactoryBot.create(:admin) } +
                2.times.map {User.invite!(email: FactoryBot.generate(:email))}
  }
  let(:page) { Capybara::Node::Simple.new(rendered) }

  before do
    allow(presenter).to receive(:users).and_return(users)
    assign(:presenter, presenter)
    render
  end

  context "generic users" do
    it "draws user invite form" do
      expect(page).to have_selector("div.users-invite")
      expect(page).to have_content("Add or Invite user via email")
    end

    it "draws user list with all users" do
      expect(page).to have_selector("div.users-listing")
      expect(page).to have_content("Username")
      expect(page).to have_content("Roles")
      expect(page).to have_content("Last access")
      expect(page).to have_content("Status")
      expect(page).to have_content("Action")
      # Delete button next to each user
      expect(page).to have_selector('a', class: 'action-delete', count: users.count)
    end

    it "lists all the users" do
      users.each do |user|
        expect(page).to have_content(user.email)
      end
    end
  end

  context "with admin users" do
    it "lists users as having admin role" do
      expect(page).to have_selector("div.users-listing li", text: 'admin', count: 2)
    end
  end

  context "with a user who hasn't accepted an invitation" do
    it "lists one user as pending status, and others as active" do
      expect(page).to have_selector("div.users-listing td", text: 'Pending', count: 2)
    end
  end
end

