class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :kind
      t.text :description
      t.string :twitter
      t.string :facebook
      t.string :website
      t.boolean :accepts_cards

      t.timestamps
    end
  end
end
