require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  subject { 
    described_class.new(task.attributes.reject{|att| att == 'id'})
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a status" do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it "return correct translated human_status" do
    expect(subject.human_status).to eql(Task.human_attribute_name(subject.status))
  end

  describe "marking as done or undone" do
    it "should change status to done" do
      expect(subject.status).to eql("backlog")
      subject.update_status
      expect(subject.status).to eql('done')
    end

    it "should change status to in_progress" do
      subject.status = :done
      expect(subject.status).to eql('done')
      subject.update_status
      expect(subject.status).to eql('in_progress')
    end
  end
end
