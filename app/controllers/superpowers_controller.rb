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

  def destroy
  end

  private

  def superpower_params
    params.require(:superpower).permit(:photo)
  end

end
