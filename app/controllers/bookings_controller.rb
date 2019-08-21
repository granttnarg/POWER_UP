class BookingsController < ApplicationController
  def new
    @superpower = Superpower.find(params[:superpower_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @superpower = Superpower.find(params[:superpower_id])
    @booking.user = current_user
    @booking.superpower = @superpower
    if @booking.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

private

  def booking_params
    params.require(:booking).permit(:date, :superpower_id, :user_id)
  end


end
