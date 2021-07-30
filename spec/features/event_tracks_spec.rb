require 'rails_helper'

RSpec.feature 'EventTracks', type: :feature do
  let(:event_track) { create(:event_track) }

  before(:each) do
    EventTrack.create(event_track.attributes.reject{|att| att == 'id'})
  end

  context 'get a event track list' do
    scenario 'should to return a list of existing event tracks' do
      visit event_tracks_path

      expect(page).to have_content('Lista de Evento')
      expect(page).to have_content('Tipo de Evento', count: EventTrack.count)
    end
  end
end