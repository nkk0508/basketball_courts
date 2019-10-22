class RenameNewCourtsTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :new_courts_tables, :courts
  end
end
