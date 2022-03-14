class Lesson < ApplicationRecord
  has_many :meetings
  has_many :wishlist_itens

  belongs_to :user
  belongs_to :topic
end
