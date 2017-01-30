# frozen_string_literal: true
require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success' do
      get :index
      expect(response).to have_http_status :success
    end
  end

  describe 'POST #create' do
    it 'creates a message' do
      expect {
        post :create, params: { message: { content: 'Some great content' } }
      }.to change {
        user.messages.count
      }.by(1)
    end

    it 'redirects to messages page' do
      sign_in user
      post :create, params: { message: { content: 'Some great content' } }
      expect(response).to redirect_to(messages_path)
    end
  end
end