# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProjectInfos', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/project_infos/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/project_infos/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
