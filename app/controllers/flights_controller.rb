class FlightsController < ApplicationController
  def calculate_fuel
    ship_mass = params[:ship_mass].to_i
    flight_plan = params[:flight_plan]

    if ship_mass.nil? || flight_plan.nil?
      render json: { error: 'ship_mass and flight_plan are required' }, status: :bad_request
      return
    end

    calculator = FlightFuelCalculatorService.new(ship_mass, flight_plan)
    fuel_required = calculator.calculate_total_fuel

    render json: { fuel_required: calculator.calculate_total_fuel }
  end
end
