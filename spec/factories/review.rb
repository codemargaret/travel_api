FactoryBot.define do
  factory :review do
    content('Your mom was excellent last night.')
    rating(5)
    destination_id(14)
    user_id(13)
  end
end
