class CreateNewCourtsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :new_courts_tables do |t|
      t.string :court_name, :null => false
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.string :categories, :null => false
      t.boolean :non_residents, :null => false
      t.integer :postal_code, :null => false
      t.string :address, :null => false
      t.string :location_information, :null => false
      t.integer :access_count, :null => false
      t.integer :favorite_count, :null => false
      t.integer :charge
      t.string :url
      t.string :image_name
      t.text :description

      t.timestamps
    end
  end
end
