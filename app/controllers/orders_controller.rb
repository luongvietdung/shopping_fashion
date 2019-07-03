# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    if @order.status == "Closed"
      flash[:error] = "Order canceled"
      redirect_to orders_path
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: 2)
    redirect_to orders_path, succes: "Order Canceled"
  end
end
