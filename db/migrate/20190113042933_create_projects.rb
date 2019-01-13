class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :admin_user_id, null: false, limit: 8
      t.foreign_key :admin_users, column: :admin_user_id
      t.string :name
      t.timestamps
    end
  end
end
