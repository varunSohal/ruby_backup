class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search].present?
      keyword = "%#{params[:search].downcase}%"
      @products = @products.where("name LIKE ? OR desc LIKE ?", keyword, keyword)
    end

    # Apply category filtering if category_id is present
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    # Paginate the products
    @products = @products.page(params[:page]).per(10)
  end
end
