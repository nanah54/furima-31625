# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ----------------------------- | ------ | ----------- |
| email                         | string | null: false |
| password                      | string | null: false |
| nickname                      | string | null: false |
| family name                   | string | null: false |
| name                          | string | null: false |
| family name pronunciation key | string | null: false |
| name pronunciation key        | string | null: false |
| Birthday                      | string | null: false |
### Association

- has_many : items

## items テーブル

| Column           | Type     | Options                       |
| ---------------- | -------- | ----------------------------- |
| title            | string   | null: false                   |
| price            | string   | null: false                   |
| Category         | string   | null: false                   |
| Usage status     | string   | null: false                   |
| postage          | string   | null: false                   |
| Shipment source  | string   | null: false                   |
| Date of shipment | string   | null: false                   |
| catch_copy       |  text    | null: false                   |
| concept          |  text    | null: false                   |
| image            |ActiveStorageで実装                        |
| user             |references｜null: false, foreign_key: true|

### Association

- belongs_to :user


## buyers テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| card No.     | string | null: false |
| card limit m | string | null: false |
| card limit y | string | null: false |
| card code    | string | null: false |

### Association

- has_one :shipping address
- belongs_to :item

## shipping address's テーブル

| Postal code      | string   | null: false                   |
| Prefecture       | string   | null: false                   |
| Municipality     | string   | null: false                   |
| address          | string   | null: false                   |
| Building name    | string   | null: false                   |
| Sphone number    | string   | null: false                   |
### Association

- belongs_to :buyer
