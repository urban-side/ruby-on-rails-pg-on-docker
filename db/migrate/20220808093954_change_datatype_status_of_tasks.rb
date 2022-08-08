class ChangeDatatypeStatusOfTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :integer, limit: 1
    change_column_null :tasks, :status, false
    change_column :tasks, :priority, :integer, limit: 1
  end
end
