# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false,  unique: true |
| encrypted_password | string | null: false                |
| nickname           | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :items
- has_many :purchaserecords





ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
## item テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| product_name         | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| Shipping_cost_id     | integer    | null: false                    |
| delivery_id          | integer    | null: false                    |
| shipping_day_id      | integer    | null: false                    |
| price                | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :purchaserecord






ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
## purchaserecord テーブル

| Column    | Type       | Options                                   |
| --------- | ---------- | ----------------------------------------- |
| user      | references | null: false, foreign_key: true            |
| item      | references | null: false, foreign_key: true            |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippingaddressinformation





--------------------------------------------------------------------------
## shippingaddressinformation テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| purchase      | references | null: false, foreign_key: true  |
| postal_code   | string     | null: false                     |
| delivery_id   | integer    | null: fales                     |
| municipality  | string     | null: fales                     |
| address       | string     | null: fales                     |
| buiding_name  | string     |                                 |
| phone_number  | string     | null: fales                     |


### Association

- belongs_to :purchaserecord