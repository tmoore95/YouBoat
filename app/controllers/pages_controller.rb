class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def profile
    @current_user = current_user
    @user = User.find(params[:id])
  end
end
