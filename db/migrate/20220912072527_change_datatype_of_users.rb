class ChangeDatatypeOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column_null :users, :name, false
    change_column_null :users, :email, false
  end

  def down 
    change_column_null :users, :name, true
    change_column_null :users, :email, true
  end
end
