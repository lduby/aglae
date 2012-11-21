class MembershipType < ActiveRecord::Base
  attr_accessible :name, :member_category, :is_for_local, :duration, :fee, :description
end
