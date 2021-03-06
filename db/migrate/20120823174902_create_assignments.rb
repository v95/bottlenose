class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :chapter_id, :null => false
      t.string  :name,       :null => false
      t.date    :due_date,   :null => false
      t.string  :assignment_file_name
      t.string  :grading_file_name
      t.text    :assignment

      t.timestamps
    end

    add_index :assignments, [:chapter_id]
  end
end
