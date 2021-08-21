# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do |i|
  User.create!(username: "user #{i}", email: "user#{i}@example.com", password: "password", password_confirmation: "password")
end

user = User.first

22.times do |i|
  user.posts.create!(body: "sample body #{i}")
end
