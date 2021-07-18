# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ResumeInfos', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET resume_infos#new' do
    it 'requires login' do
      get new_resume_info_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'should get new resume infos' do
      sign_in @user
      get new_resume_info_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t('resume_infos.title'))
    end
  end

  describe 'POST resume_infos#create' do
    let(:resume) { FactoryBot.create(:resume, user_id: @user.id) }
    context 'Parameters are valid' do
      it 'request should be successful' do
        sign_in @user
        post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume) }
        expect(response.status).to eq 302
      end

      it 'should create a resume' do
        expect do
          sign_in @user
          post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume) }
        end.to change(Resume, :count).by(1)
      end

      it 'should redirect to resume infos' do
        sign_in @user
        post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume) }
        expect(response).to redirect_to new_personal_info_path
      end
    end

    context 'Parameters are invalid' do
      it 'request should be successful' do
        sign_in @user
        post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume, :invalid) }
        expect(response.status).to eq 200
      end

      it 'should not create a resume' do
        expect do
          sign_in @user
          post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume, :invalid) }
        end.to_not change(Resume, :count)
      end

      it 'should display the error message' do
        sign_in @user
        post resume_work_infos_path, params: { resume: FactoryBot.attributes_for(:resume, :invalid) }
        expect(response.body).to include 'The following errors'
      end
    end
  end
end
