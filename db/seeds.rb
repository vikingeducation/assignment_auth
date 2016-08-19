# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create(email: "chuck@norris.com", username: "chuck", password_digest: Digest::SHA1.base64digest("chuckskick") )

10.times do
  User.create(email: Faker::Internet.email, username:Faker::Internet.user_name, password_digest: Digest::SHA1.base64digest("password") )
end
