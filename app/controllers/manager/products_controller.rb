# frozen_string_literal: true

module Manager
  class ProductsController < Manager::BaseController
    def index
      @products = Product.all.page(params[:page]).per(10)
    end
  end
end
