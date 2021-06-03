class BookingsController < ApplicationController
   def index
    @listings = Listing.all
    @bookings = current_user.bookings
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
  end

  def show
<<<<<<< HEAD
    @listing = Listing.find(params[:id])
    @booking = Booking.find(params[:id])
    @marker = [{
      lat: @listing.latitude,
      lng: @listing.longitude
    }]
=======
    @current_user = current_user
    @booking = Booking.find(params[:id])
    c_listings = []
    @current_user.listings.each { |l| c_listings << l.id }
    @owner = c_listings.include?(@booking.listing_id)
>>>>>>> a6599fc9ed3113a1e61a4a7df83baea58f149480
  end
  
  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @current_user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path(@booking.user)
  end

  private
  
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
