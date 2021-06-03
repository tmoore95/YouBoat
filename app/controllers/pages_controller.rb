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
    @mbapproved = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status == 'approved' }
    @mbcancelled = Booking.all.select { |b| c_listings.include?(b.listing_id) && b.status == 'cancelled' }   
  end
end
