class AddUserIndexToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :user_id, :integer
    add_index :projects, :user_id
    remove_column :projects, :author_id, :integer
  end
end
