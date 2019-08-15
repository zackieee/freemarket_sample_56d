# TODO: 今後使うかもしれないので残しておきます。

# FactoryBot.define do
#   factory :blob, class: ActiveStorage::Blob do
#     sequence(:key) { SecureRandom.urlsafe_base64 }  # ユニークなキーでなければならない
#     filename 'cat.jpg'
#     content_type 'image/jpg'
#     metadata ''
#     byte_size 13317
#     checksum 'R-EvpP3cJEEQCSwQq/FRCF=='

#     after(:create) do |blob|
#       path = blob.service.send(:path_for, blob.key)
#       FileUtils.mkdir_p(File.dirname(path))
#       FileUtils.copy_file("#{Rails.root}/spec/fixtures/cat.jpg", path) 
#     end
#   end
# end