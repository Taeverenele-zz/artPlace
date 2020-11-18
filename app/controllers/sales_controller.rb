class SalesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :set_artwork, only: [:buy, :cancel, :success]
  
  def buy
    Stripe.api_key = ENV['STRIPE_API_KEY']
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url(params[:id]),
      cancel_url: cancel_url(params[:id]),
      line_items: [
        {
          price_data: {
            currency: 'aud',
            product_data: {
              name: @artwork.title
            },
            unit_amount: (@artwork.price.to_f * 100).to_i
          },
          quantity: 1
        }
      ]
    })
    render json: session
  end
  
  def success
    # create a new instance of a sale
    @sale = Sale.create!(buyer_email: current_user.email, seller_email: @artwork.user.email, amount: @artwork.price, artwork_id: @artwork.id, user_id: current_user.id)
    # once artwork is bought it is no longer available
    @artwork.availability = false
    @artwork.save
    redirect_to order_path(@sale)
  end
  
  def show
    # find the current sale
    @sale = Sale.find(params[:id])
    # find tha artwork linked to the current sale
    @artwork = @sale.artwork
  end

  def cancel
    # display message when transaction cancelled
    respond_to do |format|
      format.html { redirect_to artwork_path, notice: 'Transaction was cancelled' }
      format.json { head :no_content }
    end
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

end
