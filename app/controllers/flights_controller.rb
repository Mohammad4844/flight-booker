class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show ]
  before_action :set_codes

  # GET /flights or /flights.json
  def index
    @flights = Flight.all
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    def set_codes
      puts "doing this"
      @airport_codes = Airport.all.map{ |a| [ a.code, a.id ] }
      @airline_codes = Airline.all.map{ |a| [ a.code, a.id ] }
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:depart_id, :arrive_id, :airline_id, :start_date_time, :duration_min)
    end
end
