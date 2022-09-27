class ChangeLabellingsToTasksLabels < ActiveRecord::Migration[5.2]
  def change
    rename_table :labellings, :tasks_labels
  end
end
