class CreateProjectImages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_images do |t|
      t.integer :project_id, null: false, index: true, limit: 8
      t.foreign_key :projects, column: :project_id
      t.timestamps
    end
  end
end
