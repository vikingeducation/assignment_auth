User.destroy_all

30.times do
  u = User.new
  u.username = Faker::Internet.user_name
  u.email = Faker::Internet.email
  u.password = "ayy_lmao"
  u.password_confirmation = "ayy_lmao"
  u.save!
end
