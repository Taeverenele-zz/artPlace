class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
    if current_user
      redirect_to artworks_path
    end
  end
  def dashboard
    @artworks = current_user.artworks
  end
end
