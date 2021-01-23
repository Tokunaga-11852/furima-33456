# README

   users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| second_name        | string | null: false               |
| first_katakana     | string | null: false               |
| second_katakana    | string | null: false               |
| birthday           | date   | null: false               |


   Association
   
   - has_many :items
   - has_one :buyer_management

  items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- |------------------------------- |
| item_name               | string     | null: false                    |
| item_information        | text       | null: false                    |
| category_id             | integer    | null: false                    |
| item_condition_id       | integer    | null: false                    |
| shipping_charge_id      | integer    | null: false                    |
| shipment_source_area_id | integer    | null: false                    |
| days_to_ship_id         | integer    | null: false                    |
| price                   | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |

   Association
   - belongs_to :user
   - has_one :purchase

   purchasesテーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| postal_code             | string     | null: false |
| shipment_source_area_id | integer    | null: false |
| municipality            | string     | null: false |
| address                 | string     | null: false |
| building_name           | string     |
| phone_number            | string     | null: false |
| buyer_management        | references | null: false, foreign_key: true |

   Association

   - belongs_to :item
   - belongs_to :buyer_management

buyer_managementsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| purchase  | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

  - belongs_to :item
  - belongs_to :user
  - has_one :purchase