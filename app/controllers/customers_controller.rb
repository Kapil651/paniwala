class CustomersController < ApplicationController
 before_action :set_customer, only: [:show, :edit, :update, :destroy]
 before_action :load_areas, only: [:new, :edit, :create, :update]


  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
    @areas = Area.all
  end

  def create
   
    @customer = current_supplier.customers.build(customer_params) 
    @customer.area_id = params[:customer][:area_id] 
   
    if @customer.save
      redirect_to customers_path, notice: 'Customer created successfully.'
     else

    puts "Error Saving Customer: #{@customer.errors.full_messages.inspect}"
     @areas = Area.all 
     render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: "Customer successfully deleted."
    else
      redirect_to customers_path, alert: "Failed to delete the customer."
    end
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:id])
    redirect_to customers_path, alert: "Customer not found." if @customer.nil?
  end

  def load_areas
    @areas = Area.all
  end

  def customer_params
   permitted_params = params.require(:customer).permit(:name, :address, :phone, :email, :area_id)
   permitted_params
  end
end

