class V1::PessoasController < V1::ApiController
  def index
    result = Pessoas::Index.call
    render json: result.pessoas, status: result.status
  end

  def show
    result = Pessoas::Show.call(id: params[:id])
    render json: result.pessoa, status: result.status
  end

  def create
    result = Pessoas::Create.call(params: pessoa_params)
    render json: result.pessoa, status: result.status
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:nome, :profissao, :localizacao, :nivel, :score)
  end
end
