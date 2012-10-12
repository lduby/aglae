class PassthroughController < ApplicationController
  def index
    path = ""
    if !user_signed_in?
      path = home_index_path
    else 
      if current_user.is?("CA_member")
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
    redirect_to path     
  end
end

