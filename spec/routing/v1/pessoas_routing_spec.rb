require 'rails_helper'

RSpec.describe V1::PessoasController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      should route(:post, '/v1/pessoas').to('v1/pessoas#create')
    end
  end
end
