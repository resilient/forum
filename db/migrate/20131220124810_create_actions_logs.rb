class CreateActionsLogs < ActiveRecord::Migration
  def change
    create_table :actions_logs do |t|
      t.integer :user_id
      t.string :username
      t.string :action
      t.integer :entity_id
      t.string :entity_name

      t.timestamps
    end
  end
end
