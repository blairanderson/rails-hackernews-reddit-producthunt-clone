require 'rails_helper'

describe ActiveApi, 'users' do
  describe 'GET   /users' do
    it 'sends a list of users' do
      length = 10

      FactoryGirl.create_list(:user, length)

      get active_api_path + 'users'
      expect(response).to be_success # test for the 200 status-code
      expect(json['users'].length).to eq(length) # check to make sure the right amount of messages are returned
    end
  end

  describe 'GET    /users/:id' do
    it 'sends a user'
  end

  describe 'POST   /users' do
    it 'lets you create an account'
  end

  describe 'PATCH  /users/:id' do
    it 'allows an authenticated user to update their account.'
  end

  describe 'PUT    /users/:id' do
    it 'allows an authenticated user to update their account.'
  end

  describe 'DELETE /users/:id' do
    it 'allows an authenticated user to delete their account.'
  end

end
