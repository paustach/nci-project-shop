class CheckoutController < ApplicationController

    def create
        product = Product.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: product.productName,
                amount: product.price,
                currency: 'eur', 
                quantity: 1,
            }],
            mode: 'payment',
            success_url: success_url,
            cancel_url: error_url,
        })
        
        redirect_to @session.url, allow_other_host: true

    end

end