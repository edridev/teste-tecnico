class V1::CandidaturasController < V1::ApiController
  def index
    candidaturas = V1::Candidatura.all

    render json: candidaturas
  end

  def show
    candidatura = V1::Candidatura.find(params[:id])
    render json: candidatura
  end

  def create
    candidatura = V1::Candidatura.new(candidatura_params)
    candidatura.save
    render Serializer.run(candidatura)
  end

  def ranking
    candidaturas = V1::Candidatura.ranking(params[:candidatura_id])
    render json: candidaturas
  end

  private

  def candidatura_params
    params.require(:candidatura).permit(:id_pessoa, :id_candidatura)
  end
end
