User.destroy_all

10.times do |i|
  User.create!( :username => "username#{i}", email: "email#{i}" )
end
