# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_reading  | string | null: false |
| first_name_reading | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                 |
| ---------------- | ---------- | ----------------------- |
| product          | string     | null: false             |
| description      | text       | null: false             |
| category_id      | integer    | null: false, ActiveHash |
| condition_id     | integer    | null: false, ActiveHash |
| burden_id        | integer    | null: false, ActiveHash |
| area_id          | integer    | null: false, ActiveHash |
| delivery_days_id | integer    | null: false, ActiveHash |
| price            | integer    | null: false             |
| user             | references | foreign_key: true       |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order