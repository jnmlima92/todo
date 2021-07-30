class EventTracksController < ApplicationController
  def index
    @event_tracks = EventTrack.all.order(created_at: :desc)
  end
end
