# テーブル設計

## users テーブル

| Column       | Type      | Options                 |
| ----------   | ------    | ----------------------- |
| nickname     | string    | null: false             |
| email        | string    | null: false             |
| password     | string    | null: false             |
| name         | string    | null: false             |
| name_reading | string    | null: false             |
| year         | integer   | null: false, ActiveHash |
| month        | integer   | null: false, ActiveHash |
| day          | integer   | null: false, ActiveHash |

### Association

- has_many :items
- has_many :orders
- has_many :addresses

## items テーブル

| Column        | Type       | Options                 |
| ----------    | ---------- | ----------------------- |
| image         |            | ActiveStorage           |
| product       | text       | null: false             |
| description   | text       | null: false             |
| category      | integer    | null: false, ActiveHash |
| condition     | integer    | null: false, ActiveHash |
| burden        | integer    | null: false, ActiveHash |
| area          | integer    | null: false, ActiveHash |
| delivery_days | integer    | null: false, ActiveHash |
| price         | integer    | null: false, ActiveHash |
| user          | references | foreign: true           |

### Association

- has_one :order
- has_one :address
- belongs_to :user

## orders テーブル

| Column | Type       | Options       |
| ------ | ---------- | ------------- |
| user   | references | foreign: true |
| item   | references | foreign: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                    |
| ------------- | ---------- | -------------------------- |
| postal_code   | integer    | null: false                |
| prefecture    | integer    | null: false, ActiveHash    |
| city          | string     | null: false                |
| house_number  | string     | null: false                |
| building_name | string     |                            |
| phone_number  | integer    | null: false                |
| user          | references | null: false, foreign: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order