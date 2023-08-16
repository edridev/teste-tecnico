class V1::CandidaturasController < ApplicationController
  def create
    result = Candidaturas::Create.call(params: candidatura_params)
    render json: result.candidatura, status: result.status
  rescue StandardError => e
    result = Application::ErrorInteractor.call(param: e)
    render json: result.error, status: :internal_server_error
  end

  def ranking
    result = Candidaturas::Ranking.call(id: params[:id])
    render json: result.candidaturas, status: result.status
  end

  private

  def candidatura_params
    params.require(:candidatura).permit(:id_pessoa, :id_vaga)
  end
end
