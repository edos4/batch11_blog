require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET #index" do
    it "returns the index page" do
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end
end
