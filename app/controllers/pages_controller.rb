class PagesController < ApplicationController
  def home
  end

  def profile
    @current_user = current_user
    @user = User.find(params[:id])
    @bookings = @current_user.bookings
    c_listings = []
    @current_user.listings.each { |l| c_listings << l.id }
    @mbpending = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status == 'pending' }
    @mbapproved = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status == 'Approved' }
    @mbcancelled = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status == 'Cancelled' }   
  end

  def booking_approve
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'Approved'
    @booking.save
    redirect_to profile_path
  end
end
