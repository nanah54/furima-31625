FactoryBot.define do
  factory :user do
    nickname                      {Faker::Name.initials(number: 2)}
    email                         {Faker::Internet.free_email}
    password                      {Faker::Internet.password(min_length: 6)}
    password_confirmation         {password}
    family_name                   {"俺"}
    first_name                    {"俺"}
    family_name_pronunciation_key {"オレ"}
    first_name_pronunciation_key  {"オレ"}
    birthday                      {19890101}
  end
end