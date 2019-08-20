class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root, :index, :show]

  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
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

  def destroy
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :photo)
  end
end
