class RemoveUserstrFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :userstr, :text
  end
end
