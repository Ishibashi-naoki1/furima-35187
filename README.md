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

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| password          | string | null: false |
| email             | string | null: false |
| first_name        | string | null: false |
| family_name       | string | null: false |
| first_name _kana  | string | null: false |
| family_name _kana | string | null: false |
| birthday          | date   | null: false |

### Association

- has_many  :comments
- has_many  :items
- belong_to :buyers
- belong_to :card


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| Seller      | integer    | null: false                    |
| condition   | integer    | null: false                    |
| category    | integer    | null: false                    |
| carriage    | integer    | null: false                    |
| origin_ship | integer    | null: false                    |
| ship_date   | integer    | null: false                    |
| carriage    | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |
| brand_id    | references | null: false, foreign_key: true |


### Association

- has_many  :comments
- has_many  :brands
- has_many  :images
- belong_to :users
- belong_to :categories
- belong_to :origin_ships

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association
- belong_to :users
- belong_to :items

## buyers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name        | string     | null: false                    |
| family_name       | string     | null: false                    |
| first_name _kana  | string     | null: false                    |
| family_name _kana | string     | null: false                    |
| post_code         | string     | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     | null: false                    |
| phone_number      | string     | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association

- belong_to :users

## card テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_id     | integer    | null: false                    |
| customer_id | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belong_to :users

## images テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| url         | string     | null: false                    |

### Association
- belong_to :items

## brands テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| name        | string     | null: false                    |

### Association
- belong_to :items

## categories テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| title       | string     | null: false                    |
| text        | text       | null: false                    |

### Association

- has_many  :items

## origin_ships テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| ship_id     | integer    | null: false                    |
| title       | string     | null: false                    |
| text        | text       | null: false                    |

### Association

- has_many  :items