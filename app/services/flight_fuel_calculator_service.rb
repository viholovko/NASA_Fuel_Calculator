class FlightFuelCalculatorService
  FUEL_FACTOR_LAUNCH = 0.042
  FUEL_FACTOR_LAND = 0.033
  FUEL_ROUND_CONSTANT_LAUNCH = 33
  FUEL_ROUND_CONSTANT_LAND = 42

  def initialize(ship_mass, flight_plan)
    @ship_mass = ship_mass
    @flight_plan = flight_plan
  end

  def calculate_total_fuel
    total_fuel = 0
    current_mass = @ship_mass
    fuel = 0

    @flight_plan.each do |directive, planet|
      gravity = Planet::GRAVITIES[planet]
      if directive == :launch
        fuel = (current_mass * gravity * FUEL_FACTOR_LAUNCH - FUEL_ROUND_CONSTANT_LAUNCH).to_i
      elsif directive == :land
        fuel = (current_mass * gravity * FUEL_FACTOR_LAND - FUEL_ROUND_CONSTANT_LAND).to_i || 0
      end
      total_fuel += fuel
      current_mass += fuel
    end

    total_fuel
  end
end
