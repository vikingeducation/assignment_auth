# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying old records..."
User.destroy_all
puts "Old records destroyed."

puts "Creating 5 Penguin Users..."
User.create(username: "CarlHagelin",
            email: "carl@pens.com",
            password_digest: BCrypt::Password.create('carl62'))

User.create(username: "PatricHornqvist",
            email: "horny@pens.com",
            password_digest: BCrypt::Password.create('patric72'))

User.create(username: "SidneyCrosby",
            email: "sid@pens.com",
            password_digest: BCrypt::Password.create('sid87'))

User.create(username: "ConorSheary",
            email: "conor@pens.com",
            password_digest: BCrypt::Password.create('conor43'))

User.create(username: "EvgeniMalkin",
            email: "geno@pens.com",
            password_digest: BCrypt::Password.create('geno81'))
puts "5 Pens created."
