class ReportsController < ApplicationController
  def prepare
  end

  def fetch
     @bookings = Booking.all

    if params[:start_date].present? && params[:end_date].present?
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @bookings = @bookings.where(created_at: @start_date.beginning_of_day..@end_date.end_of_day)

      @top_bookings = @bookings.joins(:inventory).order('inventories.price desc').limit(5)
    end

  end

  def last_days
     @bookings = Booking.where("bookings.created_at >= ?", 30.days.ago)

     @top_bookings = @bookings.joins(:inventory).order('inventories.price desc').limit(5)
    

  end
  
end

