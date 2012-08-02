class Borrowing < ActiveRecord::Base
  
  belongs_to :member
  has_one :game_copy, :child
  attr_accessible :backDate, :child_id, :game_copy_id, :member_id, :outDate
  
end
