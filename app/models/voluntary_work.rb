class VoluntaryWork < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  attr_accessible :member_id, :volunteered_at, :event_id, :note
end