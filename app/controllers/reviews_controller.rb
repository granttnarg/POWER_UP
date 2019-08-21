class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.user_id = current_user.id
    @review.booking_id = @booking.id
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
