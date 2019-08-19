# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting db"
user_one = User.new(name: "you", email: "you@hotmail.com", password: "123456")
power_one = Superpower.new(name: "Invisibility", description: "No one can see me duh!")
user_one.save!
power_one.user = user_one
power_one.save!

user_two = User.new(name: "Lestat", email: "Lestat@hotmail.com", password:"123456")
power_two = Superpower.new(name: "Immortality", description: "Get super old forever")
user_two.save!
power_two.user = user_two
power_two.save!


user_three = User.new(name: "Jorge", email: "Jorge@hotmail.com", password:"123456")
power_three = Superpower.new(name: "Flying", description: "In the sky and shit")
user_three.save!
power_three.user = user_three
power_three.save!

user_four = User.new(name: "Kaylee", email: "Kaylee@hotmail.com", password:"123456")
power_four = Superpower.new(name: "To silence people", description: "To shut up all of the chatterboxes")
user_four.save!
power_four.user = user_four
power_four.save!

puts "Created 4 seeds"

