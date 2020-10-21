class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postcode, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
