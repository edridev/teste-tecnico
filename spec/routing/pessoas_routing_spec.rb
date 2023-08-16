require 'rails_helper'

RSpec.describe PessoasController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/pessoas').to route_to('pessoas#create')
    end
  end
end
