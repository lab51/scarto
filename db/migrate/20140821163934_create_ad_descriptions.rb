class CreateAdDescriptions < ActiveRecord::Migration
  def change
    create_table :ad_descriptions do |t|
      t.text :content
      t.integer :ad_id

      t.timestamps
    end
  end
end
