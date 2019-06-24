# frozen_string_literal: true

class CartsController < ApplicationController
  def create
    @cart.add_product(params[:product_id])
    session[:cart] = @cart.data
    @cart.cart_total
  end
end
