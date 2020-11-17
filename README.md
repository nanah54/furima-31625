# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ----------------------------- | ------ | ----------- |
| email                         | string | null: false |
| encrypted_password            | string | null: false |
| nickname                      | string | null: false |
| family_name                   | string | null: false |
| name                          | string | null: false |
| family_name_pronunciation_key | string | null: false |
| name_pronunciation_key        | string | null: false |
| birthday                      | date   | null: false |
### Association

- has_many : items
- has_many : buyers

## items テーブル

| Column            | Type     | Options                       |
| ----------------- | -------- | ----------------------------- |
| title             | string   | null: false                   |
| price             | integer  | null: false                   |
| category_id       | integer  | null: false                   |
| usage_status_id   | integer  | null: false                   |
| postage_id        | integer  | null: false                   |
|shipment_source_id | integer  | null: false                   |
|date_of_shipment_id| integer  | null: false                   |
| concept           |  text    | null: false                   |
| image             |ActiveStorageで実装                        |
| user              |references｜null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column       | Type     | Options                       |
| ------------ | -------- | ----------------------------- |
| user         |references｜null: false, foreign_key: true|
| item         |references｜null: false, foreign_key: true|
### Association

- has_one :shipping address
- belongs_to :item
- belongs_to :user

## shipping_address's テーブル

| postal_code      | string   | null: false                   |
| prefecture_id    | integer  | null: false                   |
| municipality     | string   | null: false                   |
| address          | string   | null: false                   |
| building_name    | string   |                               |
| phone_number     | string   | null: false                   |
| buyer             |references｜null: false, foreign_key: true|

### Association

- belongs_to :buyer
