# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_users
  10.times do |i|
    User.create!(
      :username => "foo#{i}", 
      :email => "foo#{i}@foo.com",
      :password => "foobar#{i}",
      :password_confirmation => "foobar#{i}")
  end
end

puts "destroy users"
User.destroy_all

puts "creating users"
create_users
puts "finished creating users"

