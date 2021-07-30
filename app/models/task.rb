require 'tracker.rb'

class Task < ApplicationRecord
  include Tracker
  
  enum status: { backlog: 0, in_progress: 1, done: 2, cancelled: 3 }, _prefix: true

  validates_presence_of :description, :status

  scope :in_backlog, -> { where(status: :backlog) }
  scope :processing, -> { where(status: :in_progress) }
  scope :finished,   -> { where(status: :done) }
  scope :cancelled,  -> { where(status: :cancelled) }

  def human_status
    Task.human_attribute_name(status)
  end

  def update_status
    new_status = status_done? ? :in_progress : :done
    update(status: new_status)
    tracking_event
  end
  
  private
  
  def tracking_event
    Tracker::Event.new(self).to_track
  end
end
