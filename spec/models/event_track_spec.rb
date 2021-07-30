require 'rails_helper'

RSpec.describe EventTrack, type: :model do
  let(:event_track) { create(:event_track) }

  subject { 
    described_class.new(event_track.attributes.reject{|att| att == 'id'})
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a event_type" do
    subject.event_type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a properties" do
    subject.properties = nil
    expect(subject).to_not be_valid
  end
end
