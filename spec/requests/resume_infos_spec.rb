require 'rails_helper'

RSpec.describe "ResumeInfos", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/resume_infos/new"
      expect(response).to have_http_status(:success)
    end
  end

end
