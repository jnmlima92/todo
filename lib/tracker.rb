module Tracker
  class Event
    def initialize(task)
      @task = task
      @event_type = event_type_by_status
      @message = Message.to_track(@event_type)
    end
    
    def to_track
      event = EventTrack.create(event_type: @event_type, properties: build_event_track_properties)
      { task: @task, message: @message }
    end

    private

    def build_event_track_properties
      { color: @message.hexadecimal_color, string: @message.description }
    end
    
    def event_type_by_status
      case @task.status
      when 'done'
        'congratulations'
      when 'in_progress'
        'shame'
      else
        raise 'Invalid task status to track'
      end
    end
  end
end