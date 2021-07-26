class Message < ApplicationRecord
  validates_presence_of :description, :hexadecimal_color, :message_type
  enum message_type: { success: 0, failure: 1 }, _prefix: true

  def human_message_type
    Message.human_attribute_name(message_type)
  end
end
