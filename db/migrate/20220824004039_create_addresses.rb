class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,              null: false, default: ""
      t.string :municipalities,         null: false, default: ""
      t.string :address_number,         null: false, default: ""
      t.string :building_name,                       default: ""
      t.string :phone_number,           null: false, default: ""
      t.integer :area_id ,              null: false
      t.references :order,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
