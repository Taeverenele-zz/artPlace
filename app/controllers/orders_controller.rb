class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :set_artwork, only: [:buy]
  
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
    render plain: "Success!"
  end
  def cancel
    render plain: "Transaction was cancelled"
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

end
