class ReviewsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render 'listings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
