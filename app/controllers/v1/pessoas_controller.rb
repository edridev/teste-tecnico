class V1::PessoasController < ApplicationController
  def create
    result = Pessoas::Create.call(params: pessoa_params)
    render json: result.pessoa, status: result.status
  rescue StandardError => e
    result = Application::ErrorInteractor.call(param: e)
    render json: result.error, status: :internal_server_error
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:nome, :profissao, :localizacao, :nivel, :score)
  end
end
