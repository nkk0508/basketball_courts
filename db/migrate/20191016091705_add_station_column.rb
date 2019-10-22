class AddStationColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :courts, :station, :string
  end
end
