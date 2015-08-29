# Make a Website with my Woes

So you want to make a website, and you hear rails is a good place to start?!?!
Good choice, in all honesty i'd recommend learning whatever your friends(someone to ask for help when you get stuck!) know.

Lets get to it!

## WTF is a Website Anyways?!

Good question! Have you ever written an essay before? And then saved the text file and emailed it to yourself? Well, that text file is a real thing on your computer, its a **TEXT** file.

>the files are in the computer

Have you listened to music on itunes before?  Songs are **MP3** files.

#### Computers hold files, and there are many many **types** of files.

**Answer:** A website is an **HTML** file. Similar to a text file, but a little bit different.

#### Let me explain...

When you open chrome(firefox, etc.) and type in http://www.facebook.com/ your computer is saying 'hey facebook, give me an html file for facebook.com!' and then facebook says 'ok, heres a file' and gives your browser an HTML file :)

When you make a website, you're basically making a thing that gives people these files when they request it.

Notice that visiting *facebook.com* is different than *facebook.com/friends* ... one is the home page, and one is the "friends" page.

These(*facebook.com* and *facebook.com/friends*) are called URLs/addresses/links. Kinda like how houses in your neighborhood have addresses, websites have addresses for each section of their site.

# How To Rails

Rails is a cool way to send people HTML when their browser requests it. Mostly because rails is easy for the person building the site!(YOU)

From now on, instead of the word "Website", we're going to call it the "App". its a shorter word, and more generic. trust me.

Rails helps you build **Apps**(websites)!

In a rails app, when someone requests your home page(root), it goes to the router!

you can look at the router inside [config/routes.rb](config/routes.rb)

The router for this app looks like this:

```ruby
 # config/routes.rb

Rails.application.routes.draw do
  root to: 'items#index'

  resources :items, except: [:destroy] do
    resources :item_comments
  end

  resources :users, except: [:index]
  resources :user_sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root to: 'items#index'
    resources :items
  end
end

```
