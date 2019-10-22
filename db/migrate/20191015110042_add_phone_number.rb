class AddPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :courts, :phone_number, :string
    change_column :courts, :postal_code, :string
  end
end
