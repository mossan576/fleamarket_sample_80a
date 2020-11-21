FactoryBot.define do
  factory :credit_card do
    user_id               {"1"}
    card_id               {"car_d415a8ead3ddabdb482fe4a356b3"}
    customer_id           {"cus_e93b9e91e71c22a2c238cc88c201"}
    association :user
  end
end
