class V1::CandidaturasController < V1::ApiController
  def index
    result = Candidaturas::Index.call
    render json: result.candidaturas, status: result.status
  end

  def show
    result = Candidaturas::Show.call(id: params[:id])
    render json: result.candidatura, status: result.status
  end

  def create
    result = Candidaturas::Create.call(params: candidatura_params)
    render json: result.candidatura, status: result.status
  end

  def ranking
    result = Candidaturas::Ranking.call(id: params[:vaga_id])
    render json: result.candidaturas, status: result.status
  end

  private

  def candidatura_params
    params.require(:candidatura).permit(:id_pessoa, :id_vaga)
  end
end
