class PagesController < ApplicationController
  def home
    if current_user
      redirect_to artworks_path
    end
  end
end
