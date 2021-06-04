class ReviewsController < ApplicationController
  def create
    @listing = Listing.find(params[:id])
    @review = Review.new(review_params)
    @review.listing = @listing
    @current_user = current_user
    @review.user_id = @current_user.id
    if @review.save
    redirect_to listing_path(@listing)
    else
      render "listings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
