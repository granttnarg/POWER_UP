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
    @booking.date if valid_dates
    if @booking.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

 def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  def valid_dates
    today = Date.today
    if @booking.date < today
      false
    else
      true
   end
 end

private

  def booking_params
    params.require(:booking).permit(:date, :superpower_id, :user_id)
  end


end
