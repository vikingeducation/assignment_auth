# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all


def generate_user
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  u = User.new
  u[:username]  = first_name
  # u[:last_name]   = last_name
  u[:email]       = Faker::Internet.email("#{first_name} #{last_name}")
  u[:password_digest] = Faker::Lorem.word
  u.save

end


50.times { generate_user }
