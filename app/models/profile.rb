class Profile < ActiveRecord::Base
  belongs_to :member
  belongs_to :user
  attr_accessible :user_id, :member_id
end
