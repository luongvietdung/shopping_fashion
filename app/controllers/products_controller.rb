# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end

  def show
    @products = Product.all.order(created_at: :desc).limit(10)
  end
end
