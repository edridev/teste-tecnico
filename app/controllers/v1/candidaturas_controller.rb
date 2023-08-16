class V1::CantidaturasController < ApplicationController

  def create
    @candidatura = V1::Candidatura.new(candidatura_params)
    if @candidatura.save
      render json: @candidatura, status: :created, location: @candidatura
    else
      render json: @candidatura.errors, status: :unprocessable_entity
    end
  end

  private
    def candidatura_params
      params.require(:candidatura).permit(:id_pessoa, :id_vaga)
    end
end
