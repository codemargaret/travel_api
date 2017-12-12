# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.destroy_seeds
    seed.generate_users
    seed.generate_destinations
    seed.generate_reviews
    seed.generate_admin
  end

  def destroy_seeds
    User.destroy_all
    Destination.destroy_all
    Review.destroy_all
  end

  def generate_users
    5.times do |i|
      user = User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      )
    end
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
      country: Faker::RickAndMorty.location,
      city: Faker::LordOfTheRings.location,
      reviews_count: Faker::Number.between(1, 10)
      )
    end
  end

  def generate_reviews
    20.times do |i|
      random_destination = Destination.all.sample
      random_user = User.all.sample
      review = random_user.reviews.create(
        destination_id: random_destination.id,
        content: Faker::ChuckNorris.fact,
        rating: Faker::Number.between(1, 5)
      )
      puts "Review #{i}: Author is #{random_user.id}, Destination is #{review.destination_id}, and the content is '#{review.content}'."
    end
  end

  def generate_admin
    random_destination = Destination.all.sample
    user = User.create(
    email: 'yourmom@gmail.com',
    password: 'yourmom',
    admin: true
    )
    user.reviews.create(
    user_id: user.id,
    destination_id: random_destination.id,
    content: 'Your mom is a lovely woman.',
    rating: 5
    )
  end

end

Seed.begin

p "You now have #{User.count} users in your db"
p "You now have #{Destination.count} destinations in your db"
p "You now have #{Review.count} reviews in your db"
