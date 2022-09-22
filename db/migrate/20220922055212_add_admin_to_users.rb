class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false    # defaultはnilでありfalse判定されるが、意図が伝わるように入れておく
  end
end
