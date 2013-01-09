class MembershipType < ActiveRecord::Base
  belongs_to :member_category
  attr_accessible :name, :member_category_id, :is_for_local, :duration, :fee, :description
end
