# README

# 概要

テックキャンプの最終課題にて作成したフリーマーケットアプリケーション。

# 開発状況

  開 発 環 境   ：Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code/html&Scss  
  開 発 期 間   ：約3.5週間  
  平均作業時間   ：約 10時間  
  開 発 体 制   ：開発１人、レビュアー多数、アジャイル型開発（スクラム）、Trelloによるタスク管理

# 本番環境

URL https://furima-35187.herokuapp.com/

  ID: admin  
  Pass: 2222  

テスト用アカウント  

  <購入者用>  
  ▶︎メールアドレス: te@te.jp  
  ▶︎パスワード: te1234  
  ▶︎購入用カード情報／番号：4242424242424242／期限：3/35／セキュリティコード：123  
  <出品者用>  
  ▶︎メールアドレス名: ta@ta.jp  
  ▶︎パスワード: ta1234

# 動作確認方法

Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。  
その際は少し時間をおいてから接続ください。

接続先およびログイン情報については、上記の通りです。  
なお、同時に複数の方がログインしている場合に、ログインできない可能性がございます。

●出品方法は以下の手順で確認できます  
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

●購入方法は以下の手順で確認できます  
テストアカウントでログイン→トップページ下部から商品選択→商品購入

●確認後、ログアウト処理をお願いします。

# 開発箇所

## 開発箇所一覧

デプロイ、本番環境関連

１） トップページ（商品一覧表示  
<img src="https://user-images.githubusercontent.com/81144617/118088596-42e26680-b402-11eb-8bd9-18e5e75fb6b4.png" width="50%">  
2) ユーザー管理ページ ---------------- 3)新規商品投稿ページ  

<img src="https://user-images.githubusercontent.com/81144617/118088989-d7e55f80-b402-11eb-9973-9fd6734c3233.png" width="32%">
<img src="https://user-images.githubusercontent.com/81144617/118091903-5d1e4380-b406-11eb-86a4-1ea7c6cd4ebb.png" width="32%">
  

２）新規商品投稿ページ  
![demo](https://gyazo.com/8a289b4aa8e855c80dc2fd79c3a24f93.raw)  
３）商品編集ページ  
![demo](https://gyazo.com/57d45bf816959adf77b4c0417230fbde.raw)  
４）商品詳細ページ  
![demo](https://gyazo.com/3372ccc3603ef37bb68656b17952a699.raw)  
5）商品購入ページ  
![demo](https://gyazo.com/f31fc0a0d689c45946412b69ffb08df6.raw)  


サーバーサイド  
１)会員登録機能  
会員登録とログインを行うことができます。  
２)商品一覧表示機能  
商品を新着順で一覧表示しています。  
3) 商品出品機能  
商品出品ページで「ログインしているユーザーだけ」が商品を登録できます。  
4) 商品編集機能  
商品詳細ページで「商品を投稿したユーザーだけ」が商品の情報を編集することができます。  
なお「売れた商品は編集ができない」ようになっています。  
5) 商品削除機能  
商品詳細ページで「商品を投稿したユーザーだけ」が商品の情報を削除することができます。  
6) コメント機能  
出品商品に対しコメントができるようになっており、  
「ログインしているユーザーだけ」がコメントできるようになっています。  
また「売り切れの商品」にはコメントはできません。  
7)商品購入機能  
商品をクレジット決済で購入できるようになってます。  

# 各開発箇所の詳細

▶︎ デプロイ、本番環境関連  

<概要>  
使用技術はAWS、Ruby on Rails（6.0.0）  
<開発内容>  
基本となるroutes、controller、modelの設置  
mini_magick及びimage_processingというgemを使って画像のアップロードを実装  
S3の導入  
basic認証の実装  
本番環境でのテスト、エラー解決  

▶︎ トップページ（会員登録ページ・ログインページ・商品新着一覧ページ・）  

<概要>  
・会員登録をするページ  
・ログインをするページ  
・新着順に商品が一覧表示されるページ  

<開発内容（サーバーサイド）>  
deviseというgemを使用し会員登録及びログインページを実装  
モデルの設定（アソシエーション、バリデーション）  
単体テスト  
ログインすると出現する出品ボタンの設置  

▶︎ 商品詳細ページ  

<概要>  
出品されている商品の詳細が表示されるページ  
<開発内容（サーバーサイド）>  
出品機能で登録または編集機能で変更された内容を  
表示させるためのルーティング、コントローラーの設定  

ビューで購入に関する条件分岐を実装し、適切なリンクボタンを設置した。内容は以下の通り  

・ログインしていなければ購入ができない  
・出品者は自分が出品した商品を購入できない  
・売れていなければ購入できる  
・売れていなければ購入できない  

ビューで編集、削除に関する条件分岐を実装し、適切なリンクボタンを設置した。  
内容は以下の通り  

・出品者のみ編集、削除ができる  
・購入済の商品は編集ができない  

削除機能を実装するためのルーティング、コントローラーの設定  

▶︎ 商品編集ページ  

<概要>  
登録した商品の情報を変更ができる  
商品出品時とほぼ同じUIで実装  
画像やカテゴリーの情報など、すでに登録されている商品情報は編集画面を開いた時点で  
もれなく表示される  
<開発内容（サーバーサイド）>  
編集、変更を行うためのルーティング、コントローラーの設定  

▶︎ 商品出品ページ  

<概要>  
出品する商品の情報を登録ができる  
<開発内容（サーバーサイド）>  
activehashというgemを使用してプルダウン表示選択機能実装  
モデルの設定（アソシエーション、バリデーション）  
単体テスト  

▶︎ コメント機能  

<概要>  
出品者と購入者のやりとりができる  
<開発内容（サーバーサイド）>  
Channelを使用しスピード感あるコメント機能実装  

▶︎ 商品購入機能  

<概要>  
クレジットカード決済が可能  
<開発内容（サーバーサイド）>  
Pay.jpのAPIを利用しカード決済機能を実装  
モデルの設定（アソシエーション、バリデーション）  
単体テスト  


# 課題や今後実装したい機能

１）複数画像投稿機能  

      <目的>  

       ・商品の状態を目視で確認  

       ・販売者側の商品説明の短縮  

       ・購入者側の疑問解消"  

２）タグ付け機能  

      <目的>  

       ・検索時間の短縮  

３）検索機能  

      <目的>  

       ・検索時間の短縮  

４）プレビュー機能  

      <目的>  

       ・商品画像の不一致防止  

５）いいね機能  

      <目的>  

       ・購入者側の不安解消  

       ・販売者側のサービス向上  


# 開発を通じて得られた知見

## 工夫した点
● 最優先追加実装としてコメント機能を選びました。  

理由としては、購入者の要望と販売者の要望を  

リアルタイムで解消できるからです。  

販売者の説明不足をコメント機能によって補うことができ、  

購入者は商品に対して重点を置いている要望を販売者に提示することもできます。  

また、個人情報が渡らないようにユーザーニックネームを使い  

日付日時も見れるようにしました。配送に関わる相談に使えると考えたからです。  



## 苦労した点
● 一機能ごとにレビュアーさんに自信を持って提出致しました。  

ところがLGTMがなかなかもらえませんでした。  

コーディングでも優先順位があり、ただ必要な遷移先に遷移させれば良い問題ではなく、  

セキュリティー面や可読性の悪さ、変更に弱い記述など  

多くの角度の効いた視野の元、指摘を頂きました。  

自分が苦労し考えたコードとアドバイスを頂き改良を加えた  

記述量差に非常に驚きました。  

素人とプロの差は最後まで責任を持ち深ぼることだと身を持って知りました。  

そして、学んだことはしっかり仮説を立て着実に自分の意図したコードを記述することでした。  

間違っていれば、次の仮説が立ちますし結果的に無駄に関わるモノが劇的に減ることを学びました。  


# ER図

![furima](https://user-images.githubusercontent.com/81144617/117915253-e1e26200-b31f-11eb-9832-c8d3a8cd82a1.png)

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

- has_many  :comments
- has_many  :items
- has_many  :orders



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

- has_many  :comments
- has_one    :order
- belongs_to :user


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

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       |                                |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belong_to :users
- belong_to :items

