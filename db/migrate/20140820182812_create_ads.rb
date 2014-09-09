class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :type_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
