class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(checkout_params)
    cart.data.each do |product_id, quantity|
      @order.order_items.build(product_id: product_id, quantity: quantity) 
    end
    if @order.save
      flash[:success] = "Order created complete!"
      redirect_to root_path
    else
      render "new"
    end
  end

  def new
    @products = Product.where(id: @cart.data.keys)
    @order = current_user.orders.new
  end

  private

  def checkout_params
    params.require(:order).permit(:full_name, :address, :phone_number)
  end
end
