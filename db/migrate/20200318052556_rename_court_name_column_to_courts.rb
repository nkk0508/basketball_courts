class RenameCourtNameColumnToCourts < ActiveRecord::Migration[5.2]
  def change
    rename_column :courts, :court_name, :name
    rename_column :courts, :image_name, :image
  end
end
