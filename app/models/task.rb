class Task < ApplicationRecord
  enum status: { backlog: 0, in_progress: 1, done: 2, cancelled: 3 }, _prefix: true

  validates_presence_of :description

  scope :in_backlog, -> { where(status: :backlog) }
  scope :processing, -> { where(status: :in_progress) }
  scope :finished,   -> { where(status: :done) }
  scope :cancelled,  -> { where(status: :cancelled) }

  def human_status
    Task.human_attribute_name(status)
  end
end
