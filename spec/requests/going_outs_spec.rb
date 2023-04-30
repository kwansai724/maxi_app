require 'rails_helper'

RSpec.describe "GoingOuts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/going_outs/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/going_outs/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/going_outs/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
