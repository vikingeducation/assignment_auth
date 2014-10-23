# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..500).each do |i|
  u=User.new
  u.username="user#{i}"
  u.email="user#{i}@user.com"
  u.password="foobar"
  u.save

end