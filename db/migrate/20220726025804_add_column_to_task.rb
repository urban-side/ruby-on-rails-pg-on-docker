class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date, :timestamp
    add_column :tasks, :priority, :int2
    add_column :tasks, :label, :int
    add_column :tasks, :user, :text
  end
end
