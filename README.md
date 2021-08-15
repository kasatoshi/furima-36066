# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_Kana     | string | null: false |
| first_name_Kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :item
- has_many :comments

## item テーブル

| Column            | Type       | Options       |
| ----------------- | ---------- | ------------- |
| user              | references | null: false   |
| product_name      | strings    | null: false   |
| description       | text       | null: false   |
| category          | integer    | activestorage |
| Product condition | integer    | activestorage |
| shipping_area     | integer    | activestorage |
| shipping_day      | integer    | activestorage |
| price             | strings    | null: false   |


### Association

- has_many :users
- has_many :comments

## purchaserecord テーブル

| Column    | Type       | Options                                   |
| --------- | ---------- | ----------------------------------------- |
| user      | references | null: false, foreign_key: true            |
| item      | references | null: false, foreign_key: true            |

### Association

- belongs_to :prototype
- belongs_to :user



## shippingaddressinformation テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| purchase      | references | null: false, foreign_key: true  |
| postal_code   | references | null: false, foreign_key: true  |
| delivery_id   | integer    | null: fales                     |
| municipality  | string     | null: fales                     |
| address       | string     | null:fales                      |
| buiding_name  | string     |                                 |
| phone_number  | string     |  null: fales                    |


### Association

- belongs_to :prototype
- belongs_to :user