class CustomersController < ApplicationController
  def index; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      render :new, notice: 'Customer was not created.'
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :image, :gender)
  end
end
