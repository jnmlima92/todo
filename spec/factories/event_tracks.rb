FactoryBot.define do
  factory :event_track do
    event_type { 'congratulations' }
    properties { { color: '#2C7F35', string: 'Testing event_track' } }
  end
end