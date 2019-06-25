# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @filter = Product.ransack(params[:q])
    @products = @filter.result.page(params[:page]).order(created_at: :desc).per(::Settings.products)
    @products = @search.result.page(params[:page]).order(created_at: :desc).per(::Settings.products)
    @top_products = Product.includes(:reviews).order("reviews.rate DESC").limit(5)
  end

  def show
    @product = Product.find(params[:id])
    @another_products = Product.limit(::Settings.thumbs).find(Product.pluck(:id))
    @thumbs = @product.images.all
    @reviews = @product.reviews.order("created_at asc")
    @review = @product.reviews.build
  end
end
