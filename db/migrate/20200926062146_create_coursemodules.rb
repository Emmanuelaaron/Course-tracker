class CreateCoursemodules < ActiveRecord::Migration[5.2]
  def change
    create_table :coursemodules do |t|
      t.string :name
      t.string :icon
      t.integer :user_id
      t.timestamps
    end
  end
end
