FactoryBot.define do

  factory :address do
    user_id               {"1"}
    family_name           {"山田"}
    first_name            {"彩"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"アヤ"}
    postcode              {"0000000"}
    prefecture            {"大阪府"}
    city                  {"大阪市中央区"}
    block                 {"5丁目1-60"}
    building_name         {"なんばスカイオ15階"}
    phone_number          {"00000000000"}
    association :user
  end

end