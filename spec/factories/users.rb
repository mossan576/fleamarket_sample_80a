FactoryBot.define do

  factory :user do
    nickname              {"フリマ太郎"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"山田"}
    first_name            {"彩"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"アヤ"}
    birthday              {"2020-06-20"}
  end
end