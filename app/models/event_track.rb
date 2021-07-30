class EventTrack < ApplicationRecord
  validates_presence_of :event_type, :properties
end
