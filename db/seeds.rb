# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def destroy_all_data
  puts "Destroying all data.."
  User.destroy_all
  puts "All data destroyed."
end

def create_users(num_users = 9)
  puts "Creating random users.."
  num_users.times do
    username = Faker::Internet.user_name
    User.create!(username: username, email: Faker::Internet.safe_email(username))
  end
  puts "Random users created."
end

def create_foobar_user
  puts "Creating Mr Foo Bar.."
  User.create!(username: "foobar", email: "foo@bar.com")
  puts "Done."
end

destroy_all_data
create_users
create_foobar_user
