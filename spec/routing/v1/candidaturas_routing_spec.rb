require 'rails_helper'

RSpec.describe V1::CandidaturasController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/v1/candidaturas').to route_to('v1/candidaturas#create')
    end
  end
end
