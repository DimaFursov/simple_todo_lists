class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :status
      t.integer :priority 
      t.datetime :deadline
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
      add_index :tasks, [:project_id, :created_at]
  end
end
