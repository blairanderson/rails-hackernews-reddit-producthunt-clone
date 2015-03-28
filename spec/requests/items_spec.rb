require 'rails_helper'


describe ActiveApi, "items" do
  describe "GET   /items" do
    it 'sends a list of items' do
      length = 10

      FactoryGirl.create_list(:item, length)

      get active_api_path + "items"
      expect(response).to be_success # test for the 200 status-code
      expect(json['data'].length).to eq(length) # check to make sure the right amount of messages are returned
    end

    it 'gets authenticated items' do
      user = FactoryGirl.create(:user)
      expected_number = 4
      FactoryGirl.create_list(:item, expected_number, user: user)
      FactoryGirl.create_list(:item, rand(1..20))

      get active_api_path + "items", nil, {'Authorization' => "Token token=#{user.token}"}
      expect(response).to be_success
      expect(json['data'].length).to eq(expected_number)
    end

    it "acts like a JSON::API" do
      expected = JSON.parse(File.read(File.join(Rails.root, "spec/requests/json_api_spec.json")))
      FactoryGirl.create_list(:item, 20)
      get active_api_path + "items"
      expect(response).to be_success

      expected_links = expected['links'].keys
      expect(json['links'].keys).to eq(expected_links)
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
