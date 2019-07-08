require 'rails_helper'

RSpec.describe Samvera::Persona::UsersController, type: :controller do
  describe "#index" do
    let(:user) {FactoryBot.create(:user)}
    before do
      sign_in(user)
    end

    it "is successful" do
      get :index
      expect(response).to be_successful
      expect(assigns[:presenter]).to be_kind_of Samvera::Persona::UsersPresenter
    end
  end

  context 'as an anonymous user' do
    let(:user) { FactoryBot.create(:user) }

    describe 'DELETE #destroy' do
      subject { User.find_by(id: user.id) }

      before { delete :destroy, params: { id: user.id } }

      it "doesn't delete the user and redirects to login" do
        expect(subject).not_to be_nil
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'as an admin user' do
    let(:user) { FactoryBot.create(:admin) }
    before { sign_in user }

    describe 'DELETE #destroy' do
      before { delete :destroy, params: { id: user.to_param } }

      it "deletes the user and displays success message" do
        expect{ User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
        expect(flash[:notice]).to match "has been successfully deleted."
      end

      it "deletes the user with paranoia gem" do
        expect{User.with_deleted.find(user.id)}.to_not raise_error
      end
    end
  end

  context 'pretender' do
    let(:admin) { FactoryBot.create(:admin) }
    before { sign_in admin }

    describe 'POST #impersonate' do
      let(:current_user) { FactoryBot.create(:user) }

      it 'allows you to impersonate another user' do
        post :impersonate, params: { id: current_user.id }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'POST #stop_impersonating' do
      let(:current_user) { FactoryBot.create(:user) }

      it 'allows you to stop impersonating' do
        post :stop_impersonating, params: { id: current_user.id }
        expect(response).to redirect_to(persona_users_path)
      end
    end
  end
end
