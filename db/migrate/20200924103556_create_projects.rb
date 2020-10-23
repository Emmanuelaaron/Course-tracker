class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :author_id
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end
end
