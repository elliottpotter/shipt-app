class OrderProductsController < ApplicationController
  before_action :set_order,     only: :show
  before_action :set_product,   only: :create

  def create

  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:customer)
  end
end
