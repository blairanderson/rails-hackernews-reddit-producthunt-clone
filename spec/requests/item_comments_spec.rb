require 'rails_helper'



describe ActiveApi, 'item_comments' do

  describe "GET    /items/:item_id/item_comments" do
    before do

    end
    it 'sends a list of comments for a given item' do
      item = FactoryGirl.create(:item)

      length = 10
      FactoryGirl.create_list(:item_comment, length, item: item)

      get active_api_path + "items/#{item.id}/item_comments?parent_resource=foo"
      expect(response).to be_success
      expect(json['item_comments'].length).to eq(length) # check to make sure the right amount of messages are returned
    end

  end

  describe "POST   /items/:item_id/item_comments" do
    it 'allows an authenticated user to create a comment'
  end

  describe "GET    /items/:item_id/item_comments/:id" do
    it 'sends a single comment for a given item.'
  end

  describe "PATCH  /items/:item_id/item_comments/:id" do
    it 'allows an authenticated user to update a comment'
  end

  describe "PUT    /items/:item_id/item_comments/:id" do
    it 'allows an authenticated user to update a comment'
  end

  describe "DELETE /items/:item_id/item_comments/:id" do
    it 'allows an authenticated user to delete a comment'
  end

end



