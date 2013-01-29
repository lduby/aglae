class MemberCategory < ActiveRecord::Base
  has_many :members
  has_many :membership_types
  attr_accessible :title, :description, :is_group
end
