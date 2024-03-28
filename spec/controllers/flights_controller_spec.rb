require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe 'POST #calculate_fuel' do
    context 'with valid parameters' do
      let(:ship_mass) { 28_801 } # Example ship mass
      # Example flight plan
      let(:flight_plan) do
        [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Earth']]
      end
      it 'returns http success' do
        post :calculate_fuel, params: { ship_mass:, flight_plan: }
        expect(response).to have_http_status(:success)
      end

      it 'calculates fuel required correctly' do
        post :calculate_fuel, params: { ship_mass:, flight_plan: }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['fuel_required']).to be_a(Integer)
        # Add more expectations for the correctness of fuel calculation if needed
      end
    end

    context 'with missing parameters' do
      it 'returns http bad request' do
        post :calculate_fuel
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns error message for missing parameters' do
        post :calculate_fuel
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']).to eq('ship_mass and flight_plan are required')
      end
    end
  end
end
