require 'rails_helper'


describe ActiveApi, "items" do
  describe "GET   /items" do
    it 'sends a list of items' do
      length = 10

      FactoryGirl.create_list(:item, length)

      get active_api_path + "items"
      expect(response).to be_success # test for the 200 status-code
      expect(json['items'].length).to eq(length) # check to make sure the right amount of messages are returned
    end
  end

  describe "GET    /items/:id" do
    it 'sends an item'
  end

  describe "POST   /items" do
    it 'lets an authenticated user create an item'
  end

  describe "PATCH  /items/:id" do
    it 'lets an authenticated user update an item'
  end

  describe "PUT    /items/:id" do
    it 'lets an authenticated user update an item'
  end

  describe "DELETE /items/:id" do
    it 'lets an authenticated user delete an item'
  end

end
