FactoryBot.define do
  factory :item do
    name             {"test"}
    description      {"説明"}
    status           {"新品"}
    freight          {"送料無料"}
    shipment_source  {"大阪府"}
    ship_date        {"1〜2日"}
    price            {"1234"}
    brand            {""}
    buyer_id         {""}
    user_id          {"1"}
    category_id      {"1"}
  end
end
