require 'rails_helper'

RSpec.describe V1::CandidaturasController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      should route(:post, '/v1/candidaturas').to('v1/candidaturas#create')
      should route(:get, '/v1/vagas/1/candidaturas/ranking').to('v1/candidaturas#ranking', id: '1')
    end
  end
end
