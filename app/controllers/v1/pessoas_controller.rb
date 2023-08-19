class V1::PessoasController < V1::ApiController
  def index
    result = Pessoas::Index.call page: params[:page], per_page: params[:per_page]
    render json: result.data, status: result.status
  end

  def show
    result = Pessoas::Show.call(id: params[:id])
    render json: result.data, status: result.status
  end

  def create
    result = Pessoas::Create.call(params: pessoa_params)
    render json: result.data, status: result.status
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:nome, :profissao, :localizacao, :nivel, :experiencia, :distancia_maxima,
                                   :idioma_id, idioma_ids: [])
  end
end
