# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).limit(10)
    @cart.cart_total
  end
end
