# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @filter = Product.ransack(params[:q])
    @products = @filter.result.page(params[:page]).order(created_at: :desc).per(9)
  end

  def show
    @product = Product.find(params[:id])
    @another_products = Product.find(Product.pluck(:id).sample(4))
    @thumbs = @product.images.all
  end
end
