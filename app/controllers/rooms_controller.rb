class RoomsController < ApplicationController
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @room = Room.new
    @room.meeting_id = @meeting.id
    if @room.save
      redirect_to room_path(@room)
    else
      redirect_to lesson_path(@meeting.lesson)
    end
  end

  def show
    @room = Room.find(params[:id])
  end
end
