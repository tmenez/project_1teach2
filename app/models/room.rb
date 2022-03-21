class Room < ApplicationRecord
  require 'opentok'
  belongs_to :meeting, dependent: :destroy


  before_create :generate_room_token

  def generate_room_token
    OpentokTokenGenerator.call(self)
  end
end
