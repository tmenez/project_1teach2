class LessonsController < ApplicationController
  def index
    if params[:query].present?
      @lessons = Lesson.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @lessons = Lesson.all.order("updated_at DESC")
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @meeting = Meeting.new
    @wishlist_item = WishlistItem.new
  end

  def new
    @lesson = Lesson.new
    @topics = Topic.all
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @user = current_user
    @lesson.user = @user
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.rooms.each { |room| room.destroy }
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :start_date, :end_date, :description, :start_time, :end_time, :topic_id, :photo)
  end
end
