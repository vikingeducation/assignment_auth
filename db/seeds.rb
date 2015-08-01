# First lets destroy stuff
User.destroy_all

20.times do |i|
	u = User.new
	u.email = Faker::Internet.email
	u.username = Faker::Internet.user_name
	u.password = 'password'
	u.save!
end