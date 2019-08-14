FactoryBot.define do
  factory :product do
    id                 {"1"}
    seller_id          {"1"}
    name               {"ヒートテック"}
    text               {"テストだよ"}
    price              {"300"}
    status_id          {"1"}
    prefecture_id      {"2"}
    postage_burden_id  {"2"}
    delivery_days_id   {"2"}
    sales_status_id    {"1"}
    created_at { "2019-08-13 11:53:21" }
    updated_at { "2019-08-13 11:53:21" }
  end
end
# 全てのカラムを書き出す

