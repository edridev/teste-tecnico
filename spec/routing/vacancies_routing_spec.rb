require "rails_helper"

RSpec.describe VacanciesController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/vacancies").to route_to("vacancies#create")
    end
    
  end
end
