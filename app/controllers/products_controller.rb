class ProductsController < ApplicationController
  def index
    @products = Product.all
    filter_products_by_search
    filter_products_by_category
    paginate_products
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    product = Product.find(params.require(:product_id))
    session[:cart] ||= {}
    session[:cart][product.id] ||= 0
    session[:cart][product.id] += 1
    redirect_to products_path, notice: "#{product.name} added to cart."
  end

  def view_cart
    @cart = []
    session[:cart]&.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        @cart << { product: product, quantity: quantity }
      else
        # Remove the item from the cart if it's no longer available
        session[:cart].delete(product_id)
      end
    end
  end

  def remove_from_cart
    product = Product.find(params.require(:product_id))
    session[:cart].delete(product.id)
    redirect_to view_cart_products_path, notice: "#{product.name} removed from cart."
  end

  private

  def filter_products_by_search
    return unless params[:search].present?

    keyword = "%#{params[:search].downcase}%"
    @products = @products.where("name LIKE ? OR desc LIKE ?", keyword, keyword)
  end

  def filter_products_by_category
    return unless params[:category_id].present?

    @products = @products.where(category_id: params[:category_id])
  end

  def paginate_products
    @products = @products.page(params[:page]).per(10)
  end
end
