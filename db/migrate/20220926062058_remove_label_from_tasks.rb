class RemoveLabelFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :label, :integer
  end
end
