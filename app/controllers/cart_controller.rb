class CartController < ApplicationController
  def add_to_cart
    product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.build_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: product.id)
    @cart_item.quantity += 1
    @cart_item.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @cart = current_user.cart || Cart.new
  end

end
