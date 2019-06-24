module Manager
  class OrdersController < Manager::BaseController
    def index
      @orders = Order.page(params[:page])
    end

    def show
      @order = Order.find(params[:id])
    end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      redirect_to manager_orders_path, success: "Order Deleted"
    end
  end
end