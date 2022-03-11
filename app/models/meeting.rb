class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validate :check_lesson_time

  def check_lesson_time
    if lesson.start_date >= self.start_time
      errors.add(:start_time, 'Invalid date')
    end
    if lesson.end_date <= self.end_time
      errors.add(:end_time, 'Invalid date')
    end
  end
end
