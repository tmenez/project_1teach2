class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_one :room

  validate :check_lesson_time
  validate :check_credits

  def check_lesson_time
    if lesson.start_date >= self.start_time
      errors.add(:start_time, 'Invalid date')
    end
    if lesson.end_date <= self.end_time
      errors.add(:end_time, 'Invalid date')
    end
  end

  def check_credits
    if self.user.credits <= 0
      errors.add(:credits, 'Insuficient credits')
    end
  end
end
