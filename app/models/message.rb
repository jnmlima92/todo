class Message < ApplicationRecord
  validates_presence_of :description, :hexadecimal_color, :message_type
  enum message_type: { success: 0, failure: 1 }, _prefix: true

  scope :successing, -> { where(message_type: :success) }
  scope :failuring, -> { where(message_type: :failure) }

  def human_message_type
    Message.human_attribute_name(message_type)
  end

  def self.to_track(status)
    case status
    when 'congratulations'
      self.successing.random
    when 'shame'
      self.failuring.random
    else
      raise 'event_type to get message is not valid'
    end
  end

  private

  def self.random
    offset(rand(count)).first
  end
end
