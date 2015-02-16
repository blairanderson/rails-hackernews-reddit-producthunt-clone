# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create({
    username: "admin",
    password: "password",
    password_confirmation: "password",
    about: "About the Admin",
    admin: true
  })


[
  {url: "https://producthunt.com", title: "Product Hunt - Best way to find new products and services"},
  {url: "https://news.ycombinator.com/", title: "Hacker News - fantastic articles about tech"},
  {url: "https://reddit.com", title: "Reddit - front page of the internet"},
].each do |item|
    admin.items.create(item)
end


puts admin.items.map{|i| [i.title, i.url]}
puts "created admin user with username: 'admin' and password: 'password'"

