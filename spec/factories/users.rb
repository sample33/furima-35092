FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {Faker::Internet.free_email}
    password              {"12345a"}
    password_confirmation {password}
    family_name           {"山田"}
    family_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end
end
