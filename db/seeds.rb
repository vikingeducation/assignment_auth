# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying old user records ..."
User.destroy_all
puts "Old records destroyed."

puts "Creating new user records ..."
User.create(username: "Moshe",
            name: "Moshe",
            email: "moshe@aol.com",
            password_digest: BCrypt::Password.create('moshe_1'))

User.create(username: "David",
            name: "David",
            email: "david@yahoo.com",
            password_digest: BCrypt::Password.create('david_1'))

User.create(username: "Shelley",
            email: "shelley@gmail.com",
            name: "Shelley",
            password_digest: BCrypt::Password.create('shelley_1'))

User.create(username: "Gail",
            email: "gila@aol.com",
            name: "Gail",
            password_digest: BCrypt::Password.create('gail_1'))

User.create(username: "Howard",
            email: "howard@aol.com",
            name: "Howard",
            password_digest: BCrypt::Password.create('howard_1'))
puts "5 users created."
