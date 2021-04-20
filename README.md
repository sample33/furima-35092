# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| email              | string   | null: false,  unique: true |
| encrypted_password | string   | null: false                |
| nickname           | string   | null: false                |
| family_name        | string   | null: false                |
| first_name         | string   | null: false                |
| family_name_kana   | string   | null: false                |
| first_name_kana    | string   | null: false                |
| birthday           | date     | null: false                |

### Association

- has_many :items
- has_many :orders

##  itemsテーブル 

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| area_id            | integer    | null: false       |
| delivery_day_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :profile

## profiles テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| zip            | string     | null: false       |
| prefectures_id | integer    | null: false       | 
| city           | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| tel            | string     | null: false       |
| order          | references | foreign_key: true |

### Association

- belongs_to :order
