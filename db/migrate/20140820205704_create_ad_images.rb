class CreateAdImages < ActiveRecord::Migration
  def change
    create_table :ad_images do |t|
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.string :image7
      t.string :image8
      t.string :image9
      t.timestamps
    end
  end
end
