class CartController < ApplicationController
  def show
    @render_cart = true
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.add(@current_orderable)}
      format.html { redirect_to shop_url, notice: "Product was successfully added to the cart." }
    end

  end

  def remove
    Orderable.find_by(id: params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to shop_url, notice: "Products were removed from the cart." }
      format.json { head :no_content }
    end
    
  end
end