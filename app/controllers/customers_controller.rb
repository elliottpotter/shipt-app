class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @customer = Customer.create(customer_params)
    respond_to do |format|
      format.json { render json: { your_api_key: @customer.api_key } }
    end
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email)
  end
end
