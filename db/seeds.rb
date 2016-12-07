
def generate_users(n)
  n.times { create_user }
end

def create_user
  user_name = Faker::StarWars.character
  email = "#{ user_name }@star.wars".downcase.gsub(" ", "_")
  User.create!(username: user_name,
               email: email,
               password: "dark_side")
end

generate_users(5)
puts "Created #{ User.count } users"
