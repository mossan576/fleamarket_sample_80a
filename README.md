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
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
### Association
 - has_one :address
 - has_one :credit_card
 - has_many :favorites
 - has_many :items

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
 - belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false, unique: true|
|customer_id|string|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
 - belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|string|null: false|
|freight|integer|null: false|
|shipment_source|string|null: false|
|ship_date|integer|null: false|
|price|integer|null: false|
|brand|string||
|buyer_id|references|foreign_key:true|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
 - has_many_attached :images
 - belongs_to :user
 - has_many :favorites
 - belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|
### Association
 - has_many :items

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
 - belongs_to :user
 - belongs_to :item


## active_storage_blobsテーブル
|Column|Type|Options|
|------|----|-------|
|key|string|null: false|
|filename|string|null: false|
|content_type|string||
|metadata|text||
|byte_size|bigint|null: false|
|checksum|string|null: false|
### Association
 - has_many :attachments

## active_storage_attachmentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record|references|null: false, polymorphic: true, index: false|
|blob|references|null: false, foreign_key: true|
### Association
 - belongs_to :item
 - belongs_to :blob