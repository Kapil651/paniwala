class BookingsController < ApplicationController
  before_action :authenticate_supplier! 
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :load_dependencies, only: [:new, :edit, :create, :update]

 
  def index
    @q = Booking.ransack(params[:q])  # Initialize ransack
    @bookings = @q.result(distinct: true).page(params[:page]).per(10)  # Paginate results
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
     @booking = current_supplier.bookings.build(booking_params)
    
    if @booking.save
      redirect_to bookings_path, notice: 'Bookings created successfully.'
    else
      puts "Error Saving Booking: #{@booking.errors.full_messages.inspect}"
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
   if @booking.destroy
     redirect_to bookings_path, notice: "Booking successfully deleted."
   else
     redirect_to bookings_path, alert: "Failed to delete the booking."
   end
  end


  private

  def set_booking
    @booking = Booking.find_by(id: params[:id])
    redirect_to bookings_path, alert: "Booking not found." if @booking.nil?
  end

  def booking_params
   permitted_params = params.require(:booking).permit(:given, :receive, :customer_id, :inventory_id)
   permitted_params[:given] = permitted_params[:given].to_i if permitted_params[:given].present?
   permitted_params[:receive] = permitted_params[:receive].to_i if permitted_params[:receive].present?
   permitted_params
  end

  def load_dependencies
    @customers = Customer.all
    @inventories = Inventory.all
  end

end
