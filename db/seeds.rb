# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(first_name: "Agne", last_name: "Klimaite", username: "agne", email: "agne@me.com", password: "shit")

users = User.all
user = users.first

following = users[2..4]
followers = users[4..5]

following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
