# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nickname           | string | null: false              |
| email              | string | null: false  unique: true|
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

has_many :items
has_many :orders

 ## items テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| item_explain       | text   | null: false              |
| price              | integer | null: false              |
| commission         | integer | null: false              |
| profit             | integer | null: false              |
| user     | references | null: false, foreign_key: true |
| detail_id   | integer |  null: false, foreign_key: true |


belongs_to :user
has_one :order


 ## orders テーブル


| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| item    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
has_one :address

 ## addresses テーブル

 | Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| post_code          | string | null: false              |
| municipalities     | string | null: false              |
| address＿number    | string | null: false              |
| building_name      | string |                          |
| phone_number       | string | null: false              |
| order     | references | null: false, foreign_key: true |

belongs_to :order