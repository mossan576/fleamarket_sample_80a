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


# fleamarket_sample_80a
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string, null: false|
|birthday|integer|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|integer|null: false|
|building_name|string||
|phone_number|integer||
|credit-number|integer|null: false, unique: true|
### Association
 - has_many:products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_description|text|null: false|
|status|string|null: false|
|freight|integer|null: false|
|shipment_source|string|null: false|
|ship_date|integer|null: false|
|price|integer|null: false|
|brand|string|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
 - belongs_to :user
 - has_many :images
 - belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null; false|
### Association
 - has_many :products
 - has_many :child_categories

## child_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|child_category|string|null: false|
|category_id|integer|null: false, foreign_key: true|
### Association
 - belongs_to :product
 - has_many :grandchild_categories

## grandchild_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|grandchild_category|string|null: false|
|child_category_id|integer|null: false, foreign_key: true|
### Association
 - belongs_to :child_category


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
 - belongs_to :child_category
