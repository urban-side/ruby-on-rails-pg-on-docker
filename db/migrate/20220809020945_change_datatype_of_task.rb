class ChangeDatatypeOfTask < ActiveRecord::Migration[5.2]
  def up
    change_column_null :tasks, :title, false
    change_column_null :tasks, :description, false
  end

  def down
    change_column_null :tasks, :title, true
    change_column_null :tasks, :description, true
  end
end
