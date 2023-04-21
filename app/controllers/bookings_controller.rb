class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @url = request.url
  end

  # GET /bookings/new
  def new
    @flight = Flight.find(params_from_flights[:flight_id])

    @booking = Booking.new
    n = params_from_flights[:no_of_passengers].to_i
    n.times { @booking.passengers.build }
  end

  # POST /bookings or /bookings.json
  def create

    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
      @flight = Flight.find(@booking.flight_id)
      @passengers = Passenger.where(booking_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:flight_id,
        passengers_attributes: [:name, :email]
      )
    end

    def params_from_flights
      params.permit(:flight_id, :no_of_passengers)
    end
end
