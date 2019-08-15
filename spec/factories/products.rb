include ActionDispatch::TestProcess
FactoryBot.define do
  factory :product do
    id                 {"1"}
    seller
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
    images{ fixture_file_upload(Rails.root.join('spec', 'fixtures', 'cat.jpg'), 'image/jpg')}

    # after(:create) do |product|
    #   create(:attachment, name: 'image', record_type: 'Product', record_id: product.id)
    # end 
  end
end
# 全てのカラムを書き出す

