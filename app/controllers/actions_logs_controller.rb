class ActionsLogsController < ApplicationController
  def index
		@log_entries = ActionsLog.order("created_at DESC").all
  end
end
