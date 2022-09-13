class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :user, :userstr
    add_belongs_to :tasks, :user, foregin_key: true
  end
end
