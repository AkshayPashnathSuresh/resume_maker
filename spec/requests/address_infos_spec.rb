# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AddressInfos', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET address_infos#new' do
    it 'requires login' do
      get new_address_info_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'should get new address infos' do
      sign_in @user
      get new_address_info_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t('address_infos.title'))
    end
  end

  describe 'POST address_infos#create' do
    let(:address) { FactoryBot.create(:address, user_id: @user.id) }
    context 'Parameters are valid' do
      it 'request should be successful' do
        sign_in @user
        post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address) }
        expect(response.status).to eq 302
      end

      it 'should create an address' do
        expect do
          sign_in @user
          post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address) }
        end.to change(Address, :count).by(1)
      end

      it 'should redirect to education infos' do
        sign_in @user
        post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address) }
        expect(response).to redirect_to new_education_info_path
      end
    end

    context 'Parameters are invalid' do
      it 'request should be successful' do
        sign_in @user
        post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address, :invalid) }
        expect(response.status).to eq 200
      end

      it 'should not create an address' do
        expect do
          sign_in @user
          post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address, :invalid) }
        end.to_not change(Address, :count)
      end

      it 'should display the error message' do
        sign_in @user
        post create_address_infos_path, params: { address: FactoryBot.attributes_for(:address, :invalid) }
        expect(response.body).to include 'The following errors'
      end
    end
  end
end
