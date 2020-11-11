class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.integer :freight, null:false
      t.string :shipment_source, null:false
      t.integer :ship_date, null:false
      t.integer :price, null: false
      t.string :brand
      t.integer :buyer_id
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
