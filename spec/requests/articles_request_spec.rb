require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/articles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/articles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/articles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/articles/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/articles/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
