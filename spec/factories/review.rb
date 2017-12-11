FactoryBot.define do
  factory :review do
    content('Your mom was excellent last night.')
    rating(5)
    destination_id(1)
    user_id(1)
  end
end
