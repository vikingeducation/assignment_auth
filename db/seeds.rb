# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all


MULTIPLIER = 10


def generate_users
	user = User.new

	user[:username] = Faker::Name.first_name
	user[:email] = Faker::Internet.email

	password = Faker::Color.color_name

	puts user.username
	puts "Password : #{password}"
	user[:password_digest] = BCrypt::Password.create( password )

	user.save

end




MULTIPLIER.times { generate_users }

=begin

Susie
Password : silver
Geovany
Password : orchid
Clay
Password : sky blue
Taryn
Password : indigo
Aida
Password : white
Maritza
Password : lavender
Frederik
Password : white
Eula
Password : blue
Milan
Password : silver
Candelario
Password : olive

=end