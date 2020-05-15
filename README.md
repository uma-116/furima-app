# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_one :profile
- has_one :address
- has_one :credit_card
- has_many :items


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment_name|string| |
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|postage|string|null: false|
|ship_from|string|null: false|
|ship_date|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
### Association
- belongs_to :user
- has_many :imgs
- belongs_to :category
- belongs_to :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|img|string|null: false|
|item_id|integer|null: falsem foreign_key: true|
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string| |
### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :items