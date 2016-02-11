# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create(username: "thomas", email: "foobar@bar.com", password_digest: "password" )
User.create(username: "koz", email: "tetris@bar.com", password_digest: "password")
User.create(username: "koz2", email: "tetris2@bar.com", password_digest: "password2")
User.create(username: "koz3", email: "tetris3@bar.com", password_digest: "password3")
User.create(username: "koz4", email: "tetris4@bar.com", password_digest: "password4")
User.create(username: "koz5", email: "tetris5@bar.com", password_digest: "password5")
