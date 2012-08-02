class Child < ActiveRecord::Base
  belongs_to :member
  has_many :borrowings
  attr_accessible :birthdate, :firstname, :lastname, :memberid, :sex
end
