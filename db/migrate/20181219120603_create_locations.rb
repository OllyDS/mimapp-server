class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :name
      t.string :places_id
      t.float :lat
      t.float :lng
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
