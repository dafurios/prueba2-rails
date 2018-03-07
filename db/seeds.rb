# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

9.times do |i|
  Todo.create(picture: "http://placeimg.com/400/200?animals=#{i + 1}",
              title: Faker::Food.dish,
              content: Faker::Lorem.paragraph,
              )
end
