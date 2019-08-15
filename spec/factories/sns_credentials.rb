FactoryBot.define do
  factory :sns_credential do
    provider { "sns" }
    uid { "107823223" }
    association :user, factory: :user
  end
end
