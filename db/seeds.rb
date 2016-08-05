# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Stacey Tay",
             email: "stacey@thejourney.you",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@thejourney.you"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Hipster.paragraph(3)
  mood = [ "happy", "neutral", "anxious", "sad", "lethargic" ].shuffle.sample
  users.each { |user| user.posts.create!(content: content, mood: mood) }
end

User.create!(name:  "Dr Ellen Enders",
            email: "ellen.enders@thejourney.you",
            password:              "password",
            password_confirmation: "password",
            support: true)

User.create!(name:  "Shirley Tay",
             email: "mom@thejourney.you",
             password:              "password",
             password_confirmation: "password",
             support: true)
