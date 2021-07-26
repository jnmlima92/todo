class Task < ApplicationRecord
  enum status: { backlog: 0, in_progress: 1, done: 2, cancelled: 3 }, _prefix: true

  def human_status
    Task.human_attribute_name(status)
  end
end
