class Room < ApplicationRecord
  belongs_to :meeting

  before_create :generate_room_token

  def generate_room_token
    OpentokTokenGenerator.call(self)
  end
end
