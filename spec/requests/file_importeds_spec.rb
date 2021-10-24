require 'rails_helper'

RSpec.describe "FileImporteds", type: :request do
  describe "GET /file_importeds" do
    it "works! (now write some real specs)" do
      get file_importeds_path
      expect(response).to have_http_status(200)
    end
  end
end
