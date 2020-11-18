class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    # if user signed in, take them to the gallery instead of home page
    if current_user
      redirect_to artworks_path
    end
  end
  def dashboard
    # get all artworks that are available and owned by current user
    @artworks = current_user.artworks.where(availability: true)
    # get all sales where current user's email is the buyers email
    @purchases = Sale.where(buyer_email: current_user.email)
    # get all sales where the current user's email is the sellers email
    @sales = Sale.where(seller_email: current_user.email)
  end
end
