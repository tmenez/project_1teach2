class WishlistItem < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :lesson, uniqueness: { scope: :user }
end
