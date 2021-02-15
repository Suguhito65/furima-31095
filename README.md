# アプリケーション名

- FURIMA

# URL

- https://furima-31095.herokuapp.com/

# テスト用アカウント

## Basic認証のID/Pass

- ID: suguhito
- Pass: 0605

## 投稿者用

- メールアドレス: naoto@naoto.com
- パスワード: suguhito65

# 開発環境

- Ruby 2.6.5/Ruby on Rails 6.0.0/JavaScript/MySQL 5.6/Github/Visual Studio Code/AWS（S3）/heroku

# 使用画面のイメージ

![](https://i.gyazo.com/9d4f5ecfcb63e86bd6d6f4683eb22154.jpg)

![](https://i.gyazo.com/1de372a255feccbee5da63caf39cc990.jpg)

# データベース設計

![](https://i.gyazo.com/12fd72386e97138b5b3cb469781fe7d2.png)

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
| deliveryday_id   | integer    | null: false, ActiveHash |
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
