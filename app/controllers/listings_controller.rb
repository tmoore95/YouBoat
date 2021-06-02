class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    @current_user = current_user
  end

  def show
    @listing = Listing.find(params[:id])
    @current_user = current_user
  end
  
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to root_path
  end

  private
  
  def listing_params
    params.require(:listing).permit(:name, :location, :craft_type, :price_per_day, :photo)
  end
end
