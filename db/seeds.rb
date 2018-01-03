# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Destroying old data'
Rake::Task['db:migrate:reset'].invoke

puts 'Creating users'
FIRST_NAMES = [
  'Moe',
  'Larry',
  'Curly',
  'Elmer',
  'Mickey',
  'Daffy',
  'Bugs',
  'Porky',
  'Minnie',
  'Tom',
  'Jerry'
]
LAST_NAMES = [
  'Fud',
  'Mouse',
  'Duck',
  'Bunny',
  'Pig',
  'Cat'
]
PASSWORD = 'password'

users = []
FIRST_NAMES.each_with_index do |first_name, i|
  LAST_NAMES.each_with_index do |last_name, j|
    users << {
      :username => "#{first_name.downcase}_#{last_name.downcase}#{i}#{j}",
      :email => "#{first_name.downcase}@#{last_name.downcase}.com",
      :password => PASSWORD
    }
  end
end
User.create(users)

puts 'done!'
