# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| passward           | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :prototype
- has_many :comments

## item テーブル

| Column     | Type      | Options       |
| ---------- | --------- | ------------- |
| title      | string    | null: false   |
| catch_copy | text      | null: false   |
| concept    | text      | null: false   |
| image      | user      | activestorage |
| references | user      |               |

### Association

- has_many :users
- has_many :comments

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| prototype | references |             |

### Association

- belongs_to :prototype
- belongs_to :user