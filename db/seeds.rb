# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 10

puts "Destroying All Users"
User.destroy_all

puts "Creating #{MULTIPLIER} #{'user'.pluralize(MULTIPLIER)}"
MULTIPLIER.times do |x|
  User.create(:username => "user_#{x}",
              :email    => "user_#{x}@hotmail.com"
              )
end

puts "DONE"