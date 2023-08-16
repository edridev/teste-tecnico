class PeopleController < ApplicationController

  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private
    def person_params
      params.require(:person).permit(:name, :profession, :position, :level, :score)
    end
end
