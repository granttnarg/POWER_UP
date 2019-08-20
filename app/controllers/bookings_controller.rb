class BookingsController < ApplicationController
  def new
    @superpower = Superpower.find(params[:superpower_id])
    @booking = Booking.new
  end

  def create
  end

  def destroy
  end
end
