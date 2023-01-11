class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Your flight is booked!"
      PassengerMailer.with(booking: @booking).confirmation_email.deliver_now
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email])
  end
end
