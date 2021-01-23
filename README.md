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
