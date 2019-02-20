# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flat.destroy_all

10.times do
  Flat.create!(
    name: Faker::TvShows::Buffy.big_bad,
    address: Faker::Address.full_address,
    description: Faker::TvShows::Buffy.quote,
    price_per_night: Random.rand(25..300),
    number_of_guests: Random.rand(1..8),
    img_url: 'https://source.unsplash.com/random/400x200'
  )
end
