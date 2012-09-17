class Member < ActiveRecord::Base
  has_one :profile 
  has_one :account, :class_name => "User", :through => :profile, :source => :user
  has_many :children
  has_many :borrowings
  attr_accessible :address, :birthdate, :city, :firstname, :lastname, :occupation, :organization, :phone, :member_type, :zipcode
end
