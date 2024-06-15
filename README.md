# README

## users テーブル(ユーザー情報)

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| nickname     | string | null: false               |
| email        | string | null: false, unique: true |
| password     | string | null: false               |
| birth_day    | date   | null: false               | 
| first_name   | string | null: false               |
| last_name    | string | null: false               |
| read_first   | string | null: false               |
| read_last    | string | null: false               |
### Association
- has_many : items
- has many : oders

## items テーブル（商品情報）

| Column              | Type       | Options                        |
| -----------         | -----------| -------------------------------|
| user                | references | null: false, foreign_key: true |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_id         | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| duration_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
### Association
- has_one : order
- belongs_to : user

## orders テーブル（購入記録）

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
### Association
- belongs_to : user
- belongs_to : item
- belongs_to : address

## addresses テーブル（発送先情報）
| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| order              | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
### Association
- belongs_to : order