class MyProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    # record.user == user
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to my_profiles_path
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @lessons = @user.lessons
    @meetings = @user.meetings
    @wishlist = @user.wishlist_items
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio, :pronouns)
  end
end
