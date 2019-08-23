class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root, :index, :show]

  def index
    # Superpower.reindex
    @superpowers = Superpower.all
    #@superpowers = Superpower.search_by_name_and_price(params[:query])

    @superpowers = Superpower.search_by_name_and_price(params[:query]) if params[:query].present?

      if params[:range] == "100"
        @superpowers = @superpowers.select { |superpower| superpower.price > 100 }
      elsif params[:range] == "50"
        @superpowers = @superpowers.select { |superpower| superpower.price > 50 && superpower.price < 100  }
      elsif params[:range] == "0"
        @superpowers = @superpowers.select { |superpower| superpower.price <= 50 && superpower.price > 0}
      else
        @superpowers
      end

  end


  # def filter_by_price(superpowers)
  #   if params[:price] <= 50


  # end

  def show
    @superpower = Superpower.find(params[:id])
    @bookings = Booking.where(superpower_id: params[:id])
    @booking = Booking.new
    # @bookings = @superpower.bookings
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    @superpower.user = current_user
    @superpower.availability = true
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
    redirect_to superpowers_path
  end


  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :photo, :price)
  end
end
