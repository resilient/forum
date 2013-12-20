class AddEntityTitleToActionsLogs < ActiveRecord::Migration
  def change
    add_column :actions_logs, :entity_title, :string
  end
end
