# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





User.destroy_all
puts "users destroyed"
MULTIPLIER = 10


def create_user
	u = User.new
	u.username = Faker::Name.name
	u.email = Faker::Internet.email
	u.save
end


MULTIPLIER.times { create_user}

puts "users created"

