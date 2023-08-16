class V1::VagasController < ApplicationController
  def create
    result = Vagas::Create.call(params: vaga_params)
    render json: result.vaga, status: result.status
  rescue StandardError => e
    result = Application::ErrorInteractor.call(param: e)
    render json: result.error, status: :internal_server_error
  end

  private

  # Only allow a list of trusted parameters through.
  def vaga_params
    params.require(:vaga).permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
  end
end
