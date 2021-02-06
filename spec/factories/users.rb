FactoryBot.define do
  factory :user do
    nickname {"tokunaga"}
    email {Faker::Internet.free_email}
    password {"tokunaga111111"}
    password_confirmation {password}
    first_name  {"徳永"}
    second_name  {"拳一"}
    first_katakana  {"トクナガ"}
    second_katakana  {"ケンイチ"}
    birthday  {"1197/04/27"}
  end
end
