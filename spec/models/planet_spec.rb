require 'rails_helper'

RSpec.describe Planet do
  describe 'GRAVITIES' do
    it 'should contain gravity values for known planets' do
      expect(Planet::GRAVITIES).to include(
        'Earth' => 9.807,
        'Moon' => 1.62,
        'Mars' => 3.711
      )
    end
  end
end
