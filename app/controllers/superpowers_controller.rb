class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root, :index, :show]

  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
    # @booking = Booking.new
    # @bookings = @superpower.bookings
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    @superpower.user = current_user
    if @superpower.save
      redirect_to superpowers_path
    else
      render :new
    end
  end

  def edit
    set_superpower
  end

  def update
    set_superpower
    if @superpower.update(superpower_params)
      redirect_to superpowers_path
    else
      render :edit
    end
  end

  def destroy
    set_superpower
    @superpower.destroy
    redirect_to superpower_path
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :photo)
  end
end
