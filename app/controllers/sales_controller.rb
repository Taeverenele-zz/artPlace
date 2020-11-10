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
            unit_amount: @artwork.price
          },
          quantity: 1
        }
      ]
    })
    render json: session
  end
  
  def success
    @sale = @artwork.sales.create!(buyer_email: current_user.email, seller_email: @artwork.user.email, amount: @artwork.price)
    redirect_to order_path(@sale)
  end
  
  def show
    @sale = Sale.find(params[:id])
    @artwork = @sale.artwork
  end

  def cancel
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
