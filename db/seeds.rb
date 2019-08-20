# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting db"
Booking.destroy_all if Rails.env.development?
Superpower.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

invisibility_url = "https://images.immediate.co.uk/production/volatile/sites/4/2018/07/GettyImages-98310871-755c868.jpg?quality=45&crop=6px,4px,928px,399px&resize=960,413"
user_one = User.new(name: "you", email: "you@hotmail.com", password: "123456")
power_one = Superpower.new(name: "Invisibility", description: "No one can see me duh!")
user_one.save!
power_one.user = user_one
power_one.remote_photo_url = invisibility_url
power_one.save!

immortality_url = "https://wearyourvoicemag.com/wp-content/uploads/2018/02/Webp.net-resizeimage-30-800x512.jpg"
user_two = User.new(name: "Lestat", email: "Lestat@hotmail.com", password:"123456")
power_two = Superpower.new(name: "Immortality", description: "Get super old forever")
user_two.save!
power_two.user = user_two
power_two.remote_photo_url = immortality_url
power_two.save!

flying_url = "https://media.gettyimages.com/photos/superman-style-enthusiasm-concept-picture-id847458998?b=1&k=6&m=847458998&s=612x612&w=0&h=5RYw0e_YIv45PQU33MQd2QfAwYxqDCV7hqLORSCsIv8="
user_three = User.new(name: "Jorge", email: "Jorge@hotmail.com", password:"123456")
power_three = Superpower.new(name: "Flying", description: "In the sky and shit")
user_three.save!
power_three.user = user_three
power_three.remote_photo_url = flying_url
power_three.save!

silence_url = "http://images.newindianexpress.com/uploads/user/imagelibrary/2018/6/16/w600X300/IMMORTALITY.jpg"
user_four = User.new(name: "Kaylee", email: "Kaylee@hotmail.com", password:"123456")
power_four = Superpower.new(name: "To silence people", description: "To shut up all of the chatterboxes")
user_four.save!
power_four.user = user_four
power_four.remote_photo_url = silence_url
power_four.save!

puts "Created 4 seeds"

