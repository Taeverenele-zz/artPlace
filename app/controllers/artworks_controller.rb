class ArtworksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:show]

  def index
    # get all available artworks but limit to 8 per database call
    @artworks = Artwork.all.where(availability: true).paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def new
    # display new artwork form and give access to a new artwork instance
    @artwork = Artwork.new
  end

  def edit
  end

  def create
    # using the user input (params) from new form, create a new artwork and display a message
    @artwork = Artwork.new(artwork_params)
    #link current user ID to a new artwork being created
    @artwork.user_id = current_user.id
    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # getting the artwork from get_artwork method, update that artwork and display a message
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # getting the artwork from set_artwork method, destroy that artwork and display a message
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artwork_params
      params.require(:artwork).permit(:title, :author, :description, :price, :user_id, :image)
    end
end
