require "rails_helper"

RSpec.describe PeopleController, type: :routing do
  describe "routing" do
    
    it "routes to #create" do
      expect(post: "/people").to route_to("people#create")
    end

  end
end
