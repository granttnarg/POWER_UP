class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @superpowers = current_user.superpowers
  end
end
