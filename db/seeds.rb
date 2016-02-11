# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MULTIPLIER = 10

User.destroy_all

def create_user
  u = User.new
  u[:username] = Faker::Internet.user_name
  u[:email] = Faker::Internet.email
  u.save!
end

MULTIPLIER.times do
  create_user
end