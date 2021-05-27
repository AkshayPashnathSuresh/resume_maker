# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EducationInfos', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET education_infos#new' do
    it 'requires login' do
      get new_education_info_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'should get new education infos' do
      sign_in @user
      get new_education_info_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t('education_infos.title'))
    end
  end

  describe 'POST education_infos#create' do
    let(:education) { FactoryBot.create(:education, user_id: @user.id) }
    context 'Parameters are valid' do
      it 'request should be successful' do
        sign_in @user
        post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education) }
        expect(response.status).to eq 302
      end

      it 'should create an education' do
        expect do
          sign_in @user
          post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education) }
        end.to change(Education, :count).by(1)
      end

      it 'should redirect to work infos' do
        sign_in @user
        post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education) }
        expect(response).to redirect_to new_work_info_path
      end
    end

    context 'Parameters are invalid' do
      it 'request should be successful' do
        sign_in @user
        post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education, :invalid) }
        expect(response.status).to eq 200
      end

      it 'should not create an education' do
        expect do
          sign_in @user
          post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education, :invalid) }
        end.to_not change(Education, :count)
      end

      it 'should display the error message' do
        sign_in @user
        post create_education_infos_path, params: { education: FactoryBot.attributes_for(:education, :invalid) }
        expect(response.body).to include 'The following errors'
      end
    end
  end
end
