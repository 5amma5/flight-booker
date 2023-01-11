class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger_count = params[:passenger_count].to_i
    @flight_id = params[:flight]
    @passenger_count.times { @booking.passengers.build }
  end

  def create
  end
end
