# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @filter = Product.ransack(params[:q])
    @products = @filter.result.page(params[:page]).per(9)
  end
end
