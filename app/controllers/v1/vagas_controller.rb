class V1::VagasController < V1::ApiController

  def index
    result = Vagas::Index.call
    render json: result.vagas, status: result.status
  end

  def create
    result = Vagas::Create.call(params: vaga_params)
    render json: result.vaga, status: result.status
  end

  private

  # Only allow a list of trusted parameters through.
  def vaga_params
    params.require(:vaga).permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
  end
end
