class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @wishlist = @user.wishlist_items
  end
end
