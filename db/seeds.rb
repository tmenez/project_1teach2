# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
topic_names = ["Cooking", "Games", "Music", "Pottery", "Others"]
topic_names.each do |name|
  Topic.create(name: name)
end

5.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 123123

  User.create(name: name, email: email, password: password)

  user_id = User.last.id
  title = Faker::Hobby.activity
  topic_id = rand(1..5)
  start_date = Faker::Date.forward(days: 1)
  end_date = Faker::Date.forward(days: 23)
  description = " A really cool class! In this class you will learn and have a lot of fun at the same time!"
  start_time = "10:00"
  end_time = "15:00"

  Lesson.create(user_id: user_id,
                title: title,
                topic_id: topic_id,
                start_date: start_date,
                end_date: end_date,
                description: description,
                start_time: start_time,
                end_time: end_time)
end
