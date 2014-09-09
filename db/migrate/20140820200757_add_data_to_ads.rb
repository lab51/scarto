class AddDataToAds < ActiveRecord::Migration
  def change
    add_column :ads, :production_year, :integer
    add_column :ads, :km, :integer
    add_column :ads, :power, :integer
    add_column :ads, :engine_size, :integer
    add_column :ads, :gearbox, :string
    add_column :ads, :fuel, :string
    add_column :ads, :exterior_type, :string
    add_column :ads, :color, :string
    add_column :ads, :doors, :integer
    add_column :ads, :phone, :integer
    add_column :ads, :main_image, :string
    add_column :ads, :user_id, :integer
  end
end
