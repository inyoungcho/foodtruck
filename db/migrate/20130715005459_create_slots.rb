class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.references :truck
      t.string :weekday
      t.string :address
      t.string :neighborhood
      t.string :period

      t.timestamps

      t.index :truck_id
    end
  end
end
