require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      # expect(response).to be_success
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      # expect(response).to be_success
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end
  end
end
