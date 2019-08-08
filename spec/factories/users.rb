FactoryBot.define do

  factory :user do
    # password = Faker::Internet.password(min_length: 8)
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    # sequence(:email) {Faker::Internet.email}
  end

end