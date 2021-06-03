class PagesController < ApplicationController
  def home
  end

  def profile
    @current_user = current_user
    @user = User.find(params[:id])
    @bookings = @current_user.bookings
    c_listings = []
    @current_user.listings.each { |l| c_listings << l.id }
    @mbpending = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status.downcase == 'pending' }
    @mbapproved = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status.downcase == 'approved' }
    @mbcancelled = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status.downcase == 'cancelled' }
    @totalcustomer = @mbpending.count + @mbapproved.count + @mbcancelled.count
  end

  def booking_approve
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'Approved'
    @booking.save
    redirect_to profile_path
  end

  def booking_decline
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'Cancelled'
    @booking.save
    redirect_to profile_path
  end
end
