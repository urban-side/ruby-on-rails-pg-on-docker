class ChangeDatatypeStatusOfTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :status, :smallint, null: false
    change_column :tasks, :priority, :smallint
  end

  def down
    change_column :tasks, :status, :integer, null: true
    change_column :tasks, :priority, :integer
  end
end
