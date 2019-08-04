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
|email|string|null: false|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|tel|integer||
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||
|card_number|integer|null: false|
|card_year|integer|null: false|
|card_month|integer|null: false|
|card_security_code|integer|null: false|

### Association
- has_many :products
- has_many :images
- has_many :commentss
- has_many :favorites

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|category|references|null: false,foreign_key: tru|
|status|string|null: false|
|postage_burden|string|null: false|
|buyer_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|sales_status|string|null: false, default: "sale"|

### Association
- belongs_to :user
- has_many :images
- has_many :commentss
- has_many :favorites
- belongs_to :category

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|data|text|null: false|
|user|references|null: false,foreign_key: tru|
|product|references|null: false,foreign_key: tru|

### Association
- belongs_to :user
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false,foreign_key: tru|
|product|references|null: false,foreign_key: tru|

### Association
- belongs_to :user
- belongs_to :product

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: tru|
|product|references|null: false,foreign_key: tru|

### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product|references|null: false,foreign_key: tru|

### Association
- has_many :products