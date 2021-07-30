require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { create(:message) }

  subject { 
    described_class.new(message.attributes.reject{|att| att == 'id'})
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a hexadecimal_color" do
    subject.hexadecimal_color = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a message_type" do
    subject.message_type = nil
    expect(subject).to_not be_valid
  end

  it "return correct translated message_type" do
    expect(subject.human_message_type).to eql(Message.human_attribute_name(subject.message_type))
  end

  describe "returning string type to event" do
    it "should be a succesful message" do
      expect(described_class.to_track('congratulations').message_type).to eql("success")
    end

    it "should be a failure message" do
      expect(described_class.to_track('shame').message_type).to eql("failure")
    end
  end
end
