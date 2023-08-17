require 'rails_helper'

RSpec.describe V1::VagasController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      should route(:post, '/v1/vagas').to('v1/vagas#create')
    end
  end
end
