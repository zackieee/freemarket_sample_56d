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
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|tel|integer|null:false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||
|card|references|null: false,foreign_key: true|
|rating_good|integer|null: false,default: "0"|
|rating_normal|integer|null: false,default: "0"|
|rating_bad|integer|null: false,default: "0"|

### Association
- has_many :cards, dependent: :destroy
- has_many :products
- has_many :images
- has_many :comments
- has_many :favorites

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|card_number|integer|null: false|
|card_year|integer|null: false|
|card_month|integer|null: false|
|card_security_code|integer|null: false|

### Association
- belongs_to :user

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
|status|int|null: false|
|postage_burden|int|null: false|
|buyer_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|sales_status|int|null: false, default: "0"|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- has_many :commentss
- has_many :favorites
- belongs_to :category

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|data|text|null: false|
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