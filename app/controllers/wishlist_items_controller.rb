class WishlistItemsController < ApplicationController
  def create
    @wishlist_item = WishlistItem.new
    @lesson = Lesson.find(params[:lesson_id])
    @wishlist_item.user = current_user
    @wishlist_item.lesson = @lesson

    if @wishlist_item.save
      redirect_to lesson_path(@lesson)
    else
      @lesson
      render 'lessons/show'
    end
  end

  def destroy
    wishlist_item = WishlistItem.find(params[:id])
    @lesson = wishlist_item.lesson
    wishlist_item.destroy
    redirect_to lesson_path(@lesson)
  end

  private

  def wishlist_item_params
    params.require(:wishlist_item).permit(:user_id, :lesson_id)
  end
end
