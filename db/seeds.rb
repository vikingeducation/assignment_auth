# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all


user_names = %w[john andy anna tony kim jeremy winnie romain mathilde]

10.times do |t|
  user = User.new
  user.username = user_names.sample + t.to_s
  user.email = user.username + "@vcs.com"
  user.password = "password"
  user.save!
end