class VagasController < ApplicationController

  def create
    @vaga = Vaga.new(vaga_params)

    if @vaga.save
      render json: @vaga, status: :created, location: @vaga
    else
      render json: @vaga.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def vaga_params
      params.require(:vaga).permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
    end
end
