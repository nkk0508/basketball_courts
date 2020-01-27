class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :courts, :access_count, from: nil, to: 0
    change_column_default :courts, :favorite_count, from: nil, to: 0
  end
end
