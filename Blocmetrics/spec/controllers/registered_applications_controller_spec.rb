require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  before do
    @user = User.new(email: "fake@fake.com", password: "helloworld")
    @user.skip_confirmation!
    @user.save
    sign_in @user
  end

  let(:registered_application) {RegisteredApplication.create!(name: "Test" , url: "Test.com", user: @user )}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: registered_application.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http redirect" do
      post :create, params: { registered_application: { name: Faker::Dog.name, url: Faker::Internet.url } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: registered_application.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http redirect" do
      post :update, params: { id: registered_application.id, registered_application: { name: Faker::Dog.name, url: Faker::Internet.url } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #destroy" do
    it "returns http redirect" do
      get :destroy, params: {id: registered_application.id}
      expect(response).to have_http_status(:redirect)
    end
  end

end
