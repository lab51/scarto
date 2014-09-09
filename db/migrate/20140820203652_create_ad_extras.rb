class CreateAdExtras < ActiveRecord::Migration
  def change
    create_table :ad_extras do |t|
      t.boolean :clima
      t.boolean :abs
      t.boolean :asr
      t.boolean :eds
      t.boolean :esp
      t.boolean :alu
      t.boolean :alarm
      t.boolean :diff
      t.boolean :gearbox_block
      t.boolean :central_lock
      t.boolean :rain_ind
      t.boolean :electric_mirrors
      t.boolean :electric_windows
      t.boolean :hook
      t.boolean :immobilliser
      t.boolean :gas
      t.boolean :xenons
      t.boolean :heat_seats
      t.boolean :leather_seats
      t.boolean :gps_nav
      t.boolean :fog_lights
      t.boolean :tempomat
      t.boolean :wheel_helper
      t.boolean :t4x4
      t.integer :ad_id                  
      t.timestamps
    end
  end
end
