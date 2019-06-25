# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(::Settings.products)
    @top_products = Product.select("products.id, avg(reviews.rate), name, slug, price").joins(:reviews).group("products.id").order("avg(reviews.rate) DESC").limit(::Settings.products)
    @cart.cart_total
  end
end
