# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(::Settings.products)
    @top_products = Product.includes(:reviews).order("reviews.rate DESC").limit(::Settings.products)
    @cart.cart_total
  end
end
