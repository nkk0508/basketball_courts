class AddNullFalseTousersColumns < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end

  def up
    change_column_null :users, :password_digest, false, 0
    change_column :users, :password_digest, :integer, default: 0
  end

  def down
    change_column_null :users, :password_digest, true, nil
    change_column :users, :password_digest, :integer, default: nil
  end
end
