class Lesson < ApplicationRecord
  has_many :meetings

  belongs_to :user
  belongs_to :topic
end
