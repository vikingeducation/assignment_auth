puts "Deleting all Users"
User.destroy_all

puts "Creating new users"
User.create!([
  {username: 'audrey', email: 'audrey@email.com', password: 'password'},
  {username: 'bob', email: 'bob@email.com', password: 'password'},
  {username: 'coop', email: 'coop@email.com', password: 'password'}
])
