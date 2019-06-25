# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.update(status: 2)
    flash[:success] = "Order Canceled"
    redirect_to orders_path
  end
end
