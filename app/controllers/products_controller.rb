# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end
end
