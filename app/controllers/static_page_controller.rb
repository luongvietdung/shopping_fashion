# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
    @order_item = current_order.order_items.new
  end
end
