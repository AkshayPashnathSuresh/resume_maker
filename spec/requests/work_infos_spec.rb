# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WorkInfos', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET WorkInfos#new' do
    it 'requires login' do
      get new_work_info_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'should get new work infos' do
      sign_in @user
      get new_work_info_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t('work_infos.title'))
    end
  end

  describe 'POST WorkInfos#create' do
    let(:work) { FactoryBot.create(:work, user_id: @user.id) }
    context 'Parameters are valid' do
      it 'request should be successful' do
        sign_in @user
        post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work) }
        expect(response.status).to eq 302
      end

      it 'should create a work' do
        expect do
          sign_in @user
          post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work) }
        end.to change(Work, :count).by(1)
      end

      it 'should display the confirmation message' do
        sign_in @user
        post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work) }
        expect(flash[:notice]).to match(I18n.t('work_infos_controller.information_saved'))
      end

      it 'should redirect to Main menu' do
        sign_in @user
        post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work) }
        expect(response).to redirect_to root_path
      end
    end

    context 'Parameters are invalid' do
      it 'request should be successful' do
        sign_in @user
        post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work, :invalid) }
        expect(response.status).to eq 200
      end

      it 'should not create a work' do
        expect do
          sign_in @user
          post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work, :invalid) }
        end.to_not change(Work, :count)
      end

      it 'should display the error message' do
        sign_in @user
        post create_work_infos_path, params: { work: FactoryBot.attributes_for(:work, :invalid) }
        expect(response.body).to include 'The following errors'
      end
    end
  end
end
