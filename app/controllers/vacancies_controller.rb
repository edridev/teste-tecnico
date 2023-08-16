class VacanciesController < ApplicationController

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      render json: @vacancy, status: :created, location: @vacancy
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def vacancy_params
      params.require(:vacancy).permit(:company, :title, :description, :location, :level)
    end
end
