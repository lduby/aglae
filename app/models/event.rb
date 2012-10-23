class Event < ActiveRecord::Base
 
  scope :before, lambda {|end_time| {:conditions => ["end < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["start > ?", Event.format_date(start_time)] }}
  
  has_many :voluntary_works

  attr_accessible :title, :description, :start, :end, :allDay
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
  def url
    "/events/"+id.to_s
  end
  
  def as_json(options = { })
    # just in case someone says as_json(nil) and bypasses
    # our default...
    super((options || { }).merge({
        :methods => [:url]
    }))
end

end
