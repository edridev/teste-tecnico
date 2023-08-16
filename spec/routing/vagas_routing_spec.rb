require 'rails_helper'

RSpec.describe VacanciesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/vagas').to route_to('vagas#create')
    end
  end
end
