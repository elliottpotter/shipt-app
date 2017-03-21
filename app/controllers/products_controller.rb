class ProductsController < ApplicationController
  require 'csv'
  before_action :set_customer,  only: [ :index, :create, :update ]

  def index
    if @customer
      start_date      = params[:start_date].to_time
      end_date        = params[:end_date].to_time
      product_ids     = OrderProduct.where(:created_at => start_date..end_date).pluck(:product_id).uniq
      ids_and_sum     = product_ids.map{ |x| [x, OrderProduct.where(product_id: x).sum(:quantity)] }.to_h
      respond_to do |format|
        format.json { render json: { products_sold: ids_and_sum } }
        format.csv  { send_data to_csv(ids_and_sum), filename: "products-#{start_date}-#{end_date}.csv" }
      end
    else
      invalid_api_key
    end
  end

  def to_csv(collection)
    CSV.generate(headers: true) do |csv|
      csv << [ "product_id", "quantity_sold" ]
      collection.each do |object|
        csv << object
      end
    end
  end

  def create
  end

  private

  def set_customer
    @customer = Customer.where(api_key: params[:api_key]).first
  end

  def invalid_api_key
    respond_to do |format|
      format.json { render json: { error_message: "Invalid api key" }, status: 400 }
    end
  end
end
