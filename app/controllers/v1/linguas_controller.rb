class V1::LinguasController < V1::ApiController
  def index
    result = Linguas::Index.call(pessoa: get_pessoa)
    render json: result.linguas, status: result.status
  end

  def show
    result = Linguas::Show.call(pessoa: get_pessoa, id: params[:id])
    render json: result.lingua, status: result.status
  end

  def create
    result = Linguas::Create.call(pessoa: get_pessoa, params: pessoa_params)
    render json: result.lingua, status: result.status
  end

  private

  def pessoa_params
    params.require(:lingua).permit(:id_pessoa, :id_idioma, :grau)
  end

  def get_pessoa
    V1::Pessoa.find params[:pessoa_id]
  end
end
