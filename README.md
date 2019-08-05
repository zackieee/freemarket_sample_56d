# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|avatar|text|null: false,default: ""|
|introduction|text|null: false,default: ""|
|email|string|null: false|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday|date|null: false|
|tel|integer|null:false|
|sales_amont|integer|null: false,default: "0"|

### Association
- has_one :card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :products
- has_many :images
- has_many :comments
- has_many :favorites
- has_many :rated_user_ratings, class_name: 'Rating', foreign_key: 'rated_user_id'
- has_many :rater_user_ratings, class_name: 'Rating', foreign_key: 'rater_user_id'

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|card_number|integer|null: false|
|expiration_date|date|null: false|
|card_security_code|integer|null: false|

### Association
- belongs_to :user

## ratingsテーブル

|Column|Type|Options|
|------|----|-------|
|rated_user|references|null: false, foreign_key: { to_table: :users }|
|rater_user|references|null: false, foreign_key: { to_table: :users }|
|rate|integer|null: false|

### Association
- belongs_to :rated_user, class_name: 'User', foreign_key: 'rated_user_id'
- belongs_to :rater_user, class_name: 'User', foreign_key: 'rater_user_id'

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|category|references|null: false,foreign_key: true|
|brand|references|null: false,foreign_key: true|
|name|string|null: false|
|name|index|unique: true|
|text|text|null: false|
|text|index|unique: true|
|size|references|null: fals|
|status|integer|null: false|
|postage_burden|integer|null: false|
|buyer_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|sales_status|integer|null: false, default: "0"|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- has_many :sizes
- has_many :comments
- has_many :favorites
- belongs_to :category
- belongs_to :brand

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|text|null: false|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false,foreign_key: true|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|index|unique: true|
|product|references|null: false,foreign_key: true|

### Association
- has_many :products
- has_many :brands,through: :categories_brands
- has_many :categories_brands

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|index|unique: true|
|product|references|null: false,foreign_key: true|

### Association
- has_many :products
- has_many :categories,through: :categories_brands
- has_many :categories_brands

## categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category|references|null: false,foreign_key: true|
|brand|references|null: false,foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand

# sizesテーブル

|Column|Type|Options|
|------|----|-------|
|data|string|null: false|
|size_category|integer|null: false|

### Association
- has_many :products