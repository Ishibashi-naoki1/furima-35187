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
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| encrypted_password | string | null: false, default: ""  |
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

<!-- - has_many  :comments -->
- has_many  :items
- has_many  :orders
<!-- has_many  :buys は複数商品を買うため -->


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| condition     | text       | null: false                    |
| category_id   | integer    | null: false                    |
| brand_id      | integer    | null: false                    |
| carriage_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| ship_date_id  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

<!-- - has_many  :comments -->
- has_one    :order
- belongs_to :user
<!-- has_oneを使う時は親にbelongs_toを設置する -->

## orders テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer


## buyers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| order             | references | null: false, foreign_key: true |


### Association

- belongs_to  :order

<!-- ## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association
- belong_to :users
- belong_to :items -->