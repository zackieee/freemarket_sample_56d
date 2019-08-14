FactoryBot.define do

  factory :user do
    # password = Faker::Internet.password(min_length: 8)
    email                 {Faker::Internet.free_email}
    firstname             {"sasaki"}
    lastname              {"yuki"}
    firstname_kana        {"manbow"}
    lastname_kana         {"manbow"}
    birthday              {"1992-09-02"}
    tel                   {"09035563322"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    # sequence(:email) {Faker::Internet.email}
  end

end