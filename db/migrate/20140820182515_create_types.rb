class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :model_name
      t.integer :brand_id

      t.timestamps
    end
  end
end
