class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_url, :alert => exception.message
  end

	def save_action_to_log(action_name, entity_id, entity_name, entity_title = nil)
		unless current_user.role == 'user'
			@log_action = ActionsLog.new

			@log_action.user_id = current_user.id
			@log_action.username = current_user.username
			@log_action.action = action_name
			@log_action.entity_id = entity_id
			@log_action.entity_name = entity_name
			@log_action.entity_title = entity_title

			@log_action.save
		end
	end
end
