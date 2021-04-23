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
| email              | string | null: false, default: ""  |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name _kana   | string | null: false               |
| family_name _kana  | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many  :comments
- has_many  :items
- belong_to :buyers
- has_many  :buys


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| Seller      | integer    | null: false                    |
| condition   | text       | null: false                    |
| category_id | integer    | null: false                    |
| brand_id    | integer    | null: false                    |
| carriage    | integer    | null: false                    |
| ship_id     | integer    | null: false                    |
| ship_date   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- has_many  :comments
- has_many  :buys
- belong_to :users


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

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
| user              | references | null: false, foreign_key: true |

### Association

- belong_to :users

## buys テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| buy               | string     | null: false                    |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belong_to :users
- belong_to :item

