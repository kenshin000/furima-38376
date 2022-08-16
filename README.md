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
| item     | references | null: false, foreign_key: true |
| order    | references | null: false, foreign_key: true |

has_many :items
has_many :orders

 ## items テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| item_explain       | text   | null: false              |
| category           | string | null: false              |
| situation          | string | null: false              |
| send_area          | string | null: false              |
| send_day           | string | null: false              |
| price              | string | null: false              |
| user     | references | null: false, foreign_key: true |
| order    | references | null: false, foreign_key: true |

belongs_to :user
has_one :order


 ## order テーブル


| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| order    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| address  | references | null: false, foreign_key: true |

has_one :address
belongs_to :item
belongs_to :user

 ## address テーブル

 | Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| post_code          | string | null: false              |
| prefectures        | string | null: false              |
| municipalities     | string | null: false              |
| address＿number    | string | null: false              |
| building_name      | string |                          |
| phone_number       | string | null: false              |
| order     | references | null: false, foreign_key: true |

belongs_to :order