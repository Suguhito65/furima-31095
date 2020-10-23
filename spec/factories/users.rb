FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"aaaa11"}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_reading     {"タナカ"}
    first_name_reading    {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end