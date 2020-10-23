class CreateInternalprojects < ActiveRecord::Migration[5.2]
  def change
    create_table :internalprojects do |t|
      t.integer :project_id
      t.integer :coursemodule_id
      t.timestamps
    end
  end
end
