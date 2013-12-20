class ActionsLog < ActiveRecord::Base
  attr_accessible :action, :entity_id, :entity_name, :entity_title, :user_id, :username


end
