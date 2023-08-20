class V1::CandidaturasController < V1::ApiController
  def index
    sort = params[:sort] || default_sort
    candidaturas = V1::Candidatura.page(page: params[:page], per_page: params[:per_page]).order(sort)

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
    sort = 'candidaturas.created_at desc' || default_sort
    candidaturas = V1::Candidatura.ranking(params[:vaga_id]).page(page: params[:page],
                                                                  per_page: params[:per_page]).order(sort)
    render json: candidaturas
  end

  private

  def candidatura_params
    params.require(:candidatura).permit(:id_pessoa, :id_vaga)
  end
end
