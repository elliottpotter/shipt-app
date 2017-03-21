class OrdersController < ApplicationController
  before_action :set_customer,  only: [ :index, :create, :update ]
  before_action :set_order,     only: [ :show, :update ]

  skip_before_action :verify_authenticity_token

  def index
    @customer ? my_orders : invalid_api_key
  end

  def create
    @order            = Order.new
    @products         = Product.all
    @customer ? order_creation_success : invalid_api_key
  end

  def update
    if @customer && @customer.orders.ids.include?(params[:order_id])
      ids
      product           = Product.find(params[:product_id])
      quantity          = params[:quantity]
      OrderProduct.create(order: @order, product: product, quantity: quantity)
      order_update_success
    else
      invalid_api_key
    end
  end


  private

  def set_customer
    @customer = Customer.where(api_key: params[:api_key]).first
  end

  def my_orders
    @orders = @customer.orders
    respond_to do |format|
      format.json { render json: { customer: @customer.email, orders: @orders } }
    end
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def order_params
    params.require(:order).permit(:customer)
  end

  def order_creation_success
    @order.customer = @customer
    @order.save!
    respond_to do |format|
      format.json { render json: { order_id: @order.id, available_products: @products } }
    end
  end

  def order_update_success
    respond_to do |format|
      format.json { render json: { order_id: @order.id, products: @order.order_products } }
    end
  end

  def invalid_api_key
    respond_to do |format|
      format.json { render json: { error_message: "Invalid api key" }, status: 400 }
    end
  end
end
