# Reddit-Hackernews-ProductHunt Clone on Rails

**[DEMO](https://hackernews-rails-clone.herokuapp.com/)**

![Screenshot](https://cdn.rawgit.com/blairanderson/rails-hackernews-reddit-producthunt-clone/master/public/screenshot.png)

This is the `readme.md` for a Ruby on Rails application that mimics social news link sharing websites like HackerNews, ProductHunt, and Reddit.

Obviously the styling is different but the base functionality exists.

### Why?

Because when i was learning to program, I wanted to play with code that had a familiar model and get some instant gratification.

The problem with learning to code is the learning-curve. Shit is real and painful and i found that the best cure for the pain was cloning an app with features and tweaking until it broke and learning along the way.

I think this is why wordpress is SO popular. Its stupid-easy to fire-up, and changes come with one-click package installs and tiny code changes.



### Features

- A visitor can view the list of items
- A visitor can view a single item and comment on it
- A visitor can register for an account
- A user can login and logout
- A user can submit a new item
- A user can like/unlike an item
- Google Analytics Integration


### Deploy?

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

*[learn more about](https://devcenter.heroku.com/articles/app-json-schema)*

### Change the Code!!!

My main goal for this is to give new programmers some code to look at and talk about. Anytime i [get questions](https://github.com/blairanderson/rails-hackernews-reddit-producthunt-clone/issues), I plan to add them here...

*Open your terminal*

```bash

$ git clone git@github.com:blairanderson/rails-hackernews-reddit-producthunt-clone.git link-site
$ cd link-site

```

*Lets look at some code*

When someone visits your website, they're literally just *request*ing some HTML, CSS, and Javascript! *requests* come to your application through the ROUTER.

```ruby
 # config/routes.rb

Rails.application.routes.draw do
  resources :items, except: [:destroy] do
    resources :item_comments
    member do
      post :toggle
      post :vote, to: 'user_item_votes#create'
      delete :vote, to: 'user_item_votes#destroy'
    end
  end

  root to: 'items#index'

  resources :users, except: [:index]
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout, via: [:get, :post]

  namespace :admin do
    root to: 'items#index'
    resources :items
  end
end

```

## Integration test with RSpec and Capybara

When writing integration tests, try to model test around an actor(user of the system) and the action they are performing.

```ruby
 # spec/features/visitor_signs_up_spec.rb

 require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end

```
* Extract common test functionality

To share code between features move common capybara steps into a Ruby module in rspec support dir.

```ruby
 # spec/support/features/session_helpers.rb

 module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit sign_up_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign up'
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end

```

Modules must be included to share common code between tests.

```ruby
 # spec/support/features.rb

 RSpec.configure do |config|
   config.include Features::SessionHelpers, type: :feature
 end

 ```

 * Running the tests
 in your terminal you want to run the command below.

 ```ruby

 $ rspec -fd
Visitor signs up
  with valid email and password
  with invalid email
  with blank password

Finished in 0.35837 seconds
3 examples, 0 failures

```
