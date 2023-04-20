class FlightsController < ApplicationController
  before_action :set_flight
  before_action :set_codes

  # GET /flights or /flights.json
  def index
    if params.empty?
    else
      a = flight_params
      puts ""
      puts "Here are the params"
      puts a
      puts ""
    end

    date = Date.parse(flight_params[:start_date_time])
    @flights = Flight.where(flight_params.except(:start_date_time, :no_of_passengers).reject { |k, v| v.blank? })
      .where(start_date_time: (date.beginning_of_day)..(date.end_of_day))
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.new
    end

    def set_codes
      @airport_codes = Airport.all.map{ |a| [ a.code, a.id ] }
      @airline_codes = Airline.all.map{ |a| [ a.code, a.id ] }
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      date_params = params[:flight].select { |k, v| k.include?("start_date")  }
      puts date_params['start_date(1i)']
      params[:flight][:start_date_time] = date_params['start_date(1i)'] + '-' + date_params['start_date(2i)'] + '-' + date_params['start_date(3i)']
      puts "here"
      puts params[:start_date_time]
      params.require(:flight).permit(:depart_id, :arrive_id, :airline_id, :start_date_time, :no_of_passengers)
      
    end
end
