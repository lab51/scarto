class ModifyAdTable < ActiveRecord::Migration
  def change
    remove_column :ads, :main_image
    change_column :ads, :phone, :string
  end
end
