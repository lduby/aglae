class Membership < ActiveRecord::Base
  has_one :operation, :as => :operationable
  has_one :membership_type
  has_one :member
  attr_accessible :member_id, :membership_type_id, :starts_at

  def ends_at
  	self.starts_at + self.membership_type.duration.months
  end
end
