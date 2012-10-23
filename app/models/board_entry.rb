class BoardEntry < ActiveRecord::Base
  belongs_to :member
  attr_accessible :member_id, :entered_at, :left_at
end
