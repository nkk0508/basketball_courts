class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string :court_name, :null => false
      t.string :image_name
      t.boolean :monday, :null => false
      t.boolean :tuesday, :null => false
      t.boolean :wednesday, :null => false
      t.boolean :thursday, :null => false
      t.boolean :friday, :null => false
      t.boolean :saturday, :null => false
      t.boolean :sunday, :null => false
      t.string :available_time
      t.string :categories, :null => false
      t.boolean :non_residents, :null => false
      t.boolean :personal_use, :null => false
      t.boolean :group_use, :null => false
      t.string :address, :null => false
      t.string :location_information, :null => false
      t.integer :access_count, :null => false
      t.integer :favorite_count, :null => false
      t.text :description

      t.timestamps
    end
  end
end
