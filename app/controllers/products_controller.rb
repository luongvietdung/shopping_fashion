# frozen_string_literal: true

class ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(::Settings.products)
    search_result
    filter_result
    @top_products = Product.all.order_by_avg_rating.limit(::Settings.limit)
  end

  def show
    @product = Product.find(params[:id])
    @thumbs = @product.images.all
    product_details
    reviews_build
  end
end
