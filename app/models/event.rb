class Event < ActiveRecord::Base
 
  scope :before, lambda {|end_time| {:conditions => ["end < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["start > ?", Event.format_date(start_time)] }}
  
  attr_accessible :title, :description, :start, :end, :allDay
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
