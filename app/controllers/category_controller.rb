class CategoryController < ApplicationController
  def products
    @category = Category.find(params[:id])
    @products = @category.products
  end

end
