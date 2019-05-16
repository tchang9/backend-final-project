# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Jon", last_name: "Snow", email: "trueking@hotmail.com", profile_picture: "hello")
User.create(first_name: "Dragon", last_name: "Queen", email: "fakequeen@hotmail.com", profile_picture: "bye")

Event.create(name: "Korea 12/19", start_date: Date.yesterday, end_date: Date.tomorrow, location: "Korea")
Event.create(name: "Kevin's Wedding", start_date: Date.yesterday, end_date: Date.tomorrow, location: "Taiwan")

Topic.create(label: "Dinner Plans", event_id: 5)
Topic.create(label: "Gift Ideas", event_id: 5)

Comment.create(comment: "Water Bottle", topic_id: 1, user_id: 5)
Comment.create(comment: "Computer", topic_id: 1, user_id: 5)