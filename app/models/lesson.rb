class Lesson < ApplicationRecord
  has_many :meetings, dependent: :destroy
  has_many :wishlist_itens
  has_many :rooms, through: :meetings

  belongs_to :user
  belongs_to :topic

  has_one_attached :photo
end
