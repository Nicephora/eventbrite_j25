require 'faker'

User.destroy_all
10.times do
  User.create(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::StarWars.planet,
    description: Faker::TvShows::BojackHorseman.quote,
    encrypted_password: Faker::Internet.password,
    email: Faker::Name.first_name + "@yopmail.com",
  )
end
