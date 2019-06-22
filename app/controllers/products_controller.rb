# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @filter = Product.ransack(params[:q])
    @products = @filter.result.page(params[:page]).order(created_at: :desc).per(::Settings.products)
  end

  def show
    @product = Product.find(params[:id])
    @another_products = Product.limit(::Settings.thumbs).find(Product.pluck(:id))
    @thumbs = @product.images.all
    @reviews = @product.reviews.page(params[:page]).per(10)
    @review = @product.reviews.build
  end
end
