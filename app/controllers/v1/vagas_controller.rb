class V1::VagasController < V1::ApiController
  def index
    result = Vagas::Index.call page: params[:page], per_page: params[:per_page]
    render json: result.data, status: result.status
  end

  def show
    result = Vagas::Show.call(id: params[:id])
    render json: result.data, status: result.status
  end

  def create
    result = Vagas::Create.call(params: vaga_params)
    render json: result.data, status: result.status
  end

  private

  # Only allow a list of trusted parameters through.
  def vaga_params
    params.require(:vaga).permit(:empresa, :titulo, :descricao, :localizacao, :nivel, :idioma_id)
  end
end
