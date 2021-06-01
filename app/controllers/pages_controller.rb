class PagesController < ApplicationController
  def home
  end

  def profile
    @current_user = current_user
    @user = User.find(params[:id])
    @bookings = @current_user.bookings
  end
end
