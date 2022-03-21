class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)
    @lesson = Lesson.find(params[:lesson_id])
    @user = current_user
    @meeting.lesson = @lesson
    @meeting.user = @user
    @wishlist_item = WishlistItem.new
    if @user.credits <= 0
      flash[:alert] = "Insuficient credits, teach something to get more!!"
      render 'lessons/show' and return
    end

    if @meeting.save
      redirect_to lesson_path(@lesson)
    else
      render 'lessons/show'
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to lesson_path(@meeting.lesson)
    else
      render 'edit'
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @lesson = @meeting.lesson
    @meeting.destroy
    redirect_to lesson_path(@lesson)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :lesson_id, :user_id, :notes, :completed)
  end
end
