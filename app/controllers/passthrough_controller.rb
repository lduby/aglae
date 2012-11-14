class PassthroughController < ApplicationController
  def index
    path = ""
    if !user_signed_in?
      path = home_index_path
    else 
      if current_user.is?("board_member")
        path = home_dashboard_path
      elsif current_user.is?('employee')
        path = home_dashboard_path
      elsif current_user.is?('member')
        path = home_index_path
      else 
        # If you want to raise an exception or have a default root for users without roles
        path = home_index_path
      end
    end
    logger.debug("path = ")
    logger.debug(path)
    redirect_to path     
  end
end

