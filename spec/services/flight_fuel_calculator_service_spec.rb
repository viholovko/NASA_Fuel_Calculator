# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlightFuelCalculatorService do
  let(:ship_mass_apollo) { 28_801 } # Example ship mass
  let(:flight_plan_apollo) { [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Earth']] }
  let(:flight_plan_mars) { [[:launch, 'Earth'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']] }
  # Example flight plan
  let(:flight_plan_trevel) do
    [[:launch, 'Earth'],
     [:land, 'Moon'],
     [:launch, 'Moon'],
     [:land, 'Mars'],
     [:launch, 'Mars'],
     [:land, 'Earth']]
  end
  describe '#initialize' do
    it 'should initialize with ship mass and flight plan' do
      service = described_class.new(ship_mass_apollo, flight_plan_apollo)
      expect(service.instance_variable_get(:@ship_mass)).to eq(ship_mass_apollo)
      expect(service.instance_variable_get(:@flight_plan)).to eq(flight_plan_apollo)
    end
  end

  describe '#calculate_fuel' do
    it 'should calculate total fuel required for the flight Apollo 11' do
      service = described_class.new(ship_mass_apollo, flight_plan_apollo)
      expect(service.calculate_total_fuel).to eq(31_562) # Expected total fuel for the provided flight plan
    end

    it 'should calculate total fuel required for the flight Mars' do
      service = described_class.new(14_606, flight_plan_mars)
      expect(service.calculate_total_fuel).to eq(20_600) # Expected total fuel for the provided flight plan
    end

    it 'should calculate total fuel required for the flight Mars' do
      service = described_class.new(75_432, flight_plan_trevel)
      expect(service.calculate_total_fuel).to eq(129_997) # Expected total fuel for the provided flight plan
    end
  end
end
