# README

   users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| password  | string | null: false |
| email     | string | null: false |
| name      | string | null: false |
| birthday  | string | null: false |


   Association
   
   - has_many :items
   - has_one: purchases

  items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- |------------------------------- |
| item_name            | string     | null: false                    |
| item_information     | text       | null: false                    |
| category             | string     | null: false                    |
| item_condition       | string     | null: false                    |
| shipping_charge      | string     | null: false                    |
| shipment_source_area | string     | null: false                    |
| days_to_ship         | string     | null: false                    |
| price                | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

   Association

   - belongs_to :users
   - has_one :purchases

   purchasesテーブル

| Column          | Type   | Options     |
| ---------       | -------| ----------- |
| credit_card     | string | null: false |
| expiration_date | string | null: false |
| security_code   | string | null: false |
| postal_code     | string | null: false |
| prefectures     | string | null: false |
| municipality    | string | null: false |
| address         | string | null: false |
| building_name   | string | null: false |
| phone_number    | string | null: false |

   Association

   - belongs_to :users
   - belongs_to :items

