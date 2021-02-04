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



 ## users テーブル #ユーザー
| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| email               | string   | null: false |
| password            | string   | null: false |
| last_name           | string   | null: false |
| first_name          | string   | null: false |
| last_name_kana      | string   | null: false |
| first_name_kana     | string   | null: false |
| birth_date_year_id  | integer  | null: false |
| birth_date_month_id | integer  | null: false |
| birth_date_day_id   | integer  | null: false |
### Association
has_many :items
has_many :orders

belongs_to :birth_date_year_id
belongs_to :birth_date_month_id
belongs_to :birth_date_day_id



## items テーブル #商品情報
| Column               | Type          | Options     |
| -------------------- | ------------- | ----------- |
| items_name           | string        | null: false |
| items_info           | text          | null: false |
| item_category_id     | integer       | null: false |
| item_sales_status_id | integer       | null: false |
| item_shipping_id     | integer       | null: false |
| item_prefecture_id   | integer       | null: false |
| item_scheduled_id    | integer       | null: false |
| item_price           | integer       | null: false |
| add_tax_price        | integer       | null: false |
| profit               | integer       | null: false |
### Association
belongs_to :user
has_one :order

belongs_to :item_category_id
belongs_to :item_sales_status_id
belongs_to :item_shipping_id
belongs_to :item_prefecture_id
belongs_to :item_scheduled_id



## orders テーブル #購入記録
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| order       | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :item
has_one :address



## address テーブル #住所
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  |             |
| phone_number  | integer | null: false |
### Association
belongs_to :order

belongs_to :prefecture_id