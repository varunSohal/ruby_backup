class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Permit the 'search' parameter
    search_param = params[:search]

    if search_param.present?
      keyword = "%#{search_param.downcase}%"
      @products = @products.where("name LIKE ? OR desc LIKE ?", keyword, keyword)
    end

    @products = @products.page(params[:page]).per(10)
  end
end
