class CreateProjectyStatusLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :projecty_status_logs do |t|
      t.integer :project_id, null: false, limit: 8, index: true
      t.foreign_key :projects, column: :project_id
      t.integer :status, null: false, limit: 1
      t.timestamps
    end
  end
end
