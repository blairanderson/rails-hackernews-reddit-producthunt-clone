require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "users" do
  get "/user" do
    example "Current User Resource" do
      user = FactoryGirl.create(:user, password: "password", password_confirmation: "password")
      login_user_post(user.username, "password")
      get "/user"
      status.should == 200
    end
  end

  get "/user/:username" do
    example "User Resource" do
      user = FactoryGirl.create(:user)
      get "users/#{user.username}"
      status.should == 200
    end
  end
end
