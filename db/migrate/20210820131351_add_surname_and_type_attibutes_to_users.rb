class AddSurnameAndTypeAttibutesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string, default: 'User', null: false
    add_column :users, :surname, :string
    add_index :users, :type
    change_column_null :users, :name, true
  end
end
