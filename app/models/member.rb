class Member < ActiveRecord::Base
  has_one :profile 
  has_one :account, :class_name => "User", :through => :profile, :source => :user
  has_many :children
  has_many :borrowings
  has_many :board_entries, :order => 'entered_at DESC'
  has_many :voluntary_works, :order => 'volunteered_at ASC'
  attr_accessible :address, :birthdate, :city, :firstname, :lastname, :occupation, :organization, :phone, :member_type, :zipcode
  
  def name
    "#{firstname} #{lastname}"
  end
  
  def as_json(options = { })
    # just in case someone says as_json(nil) and bypasses
    # our default...
    super((options || { }).merge({
        :methods => [:name, :children_count, :is_local, :is_a_board_member, :last_entered_board_at, :is_a_volunteer, :last_volunteered_at]
    }))
  end

  def children_count 
    self.children.size
  end

  def is_local
    city == Aglae::Application.config.toy_library_city && zipcode == Aglae::Application.config.toy_library_zipcode
  end

  def is_a_board_member
    if self.board_entries.size > 0
      self.board_entries.first.left_at.nil?
    else
      false
    end
  end

  def last_entered_board_at
    if self.is_a_board_member
      self.board_entries.first.entered_at
    end
  end

  def is_a_volunteer
    self.voluntary_works.size > 0
    #if self.voluntary_works.size > 0
    #  self.voluntary_works.last.volunteered_at > Time.now - 1.year
    #end
  end

  def last_volunteered_at
    if self.voluntary_works.size > 0
      self.voluntary_works.last.volunteered_at
    end
  end

end
