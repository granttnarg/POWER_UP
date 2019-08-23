class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root, :index, :show]

  def index
    Superpower.reindex
    @superpowers = Superpower.all
    @superpowers = Superpower.search(params[:query], fields: [:name], match: :text_middle, misspellings: false) if params[:query].present?
    @superpowers = Superpower.search(params[:price], fields: [:price], match: :text_middle, misspellings: false) if params[:price].present?
  end

  def show
    @superpower = Superpower.find(params[:id])
    @bookings = Booking.where(superpower_id: params[:id])
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
    @superpower = Superpower.find(params[:id])
  end

  def update
    @superpower = Superpower.find(params[:id])
    if @superpower.update(superpower_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    set_superpower
    @superpower.destroy
    redirect_to dashboard_path
  end


  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :photo, :price)
  end
end
