# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PersonalInfos', type: :request do
  before do
    @user = create(:user)
  end
  describe 'GET personal_infos#new' do
    it 'requires login' do
      get new_personal_info_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'should get new personal infos' do
      sign_in @user
      get new_personal_info_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t('personal_infos.title'))
    end
  end

  describe 'POST personal_infos#create' do
    context 'Parameters are valid' do
      it 'request should be successful' do
        sign_in @user
        put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user2) }
        expect(response.status).to eq 302
      end
      it 'should update the first name' do
        sign_in @user
        expect do
          put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user2) }
        end.to change { User.find(@user.id).first_name }.from('user1 first name').to('user2 first name')
      end
      it 'should redirect to address infos' do
        sign_in @user
        put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user2) }
        expect(response).to redirect_to new_address_info_path
      end
    end

    context 'Parameters are invalid' do
      it 'request should be successful' do
        sign_in @user
        put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end
      it 'should not update the first name' do
        sign_in @user
        expect do
          put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User.find(@user.id), :first_name)
      end
      it 'should display the error message' do
        sign_in @user
        put create_personal_infos_path @user, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.body).to include 'The following errors'
      end
    end
  end
end
