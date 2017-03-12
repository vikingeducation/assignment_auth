# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

10.times do |user_num|
	user = User.new
	user.username = "foo#{user_num}"
	user.email = "foo#{user_num}@bar.com"
	user.password = "1366"
	user.save!
end