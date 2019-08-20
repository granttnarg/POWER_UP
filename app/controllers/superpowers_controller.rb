class SuperpowersController < ApplicationController

  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

  def new
  end

  def create
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
  end

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :photo)
  end
end
