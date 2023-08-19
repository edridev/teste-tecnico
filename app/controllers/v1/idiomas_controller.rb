class V1::IdiomasController < V1::ApiController

  def index
    idiomas = V1::Idioma.all

    render json: idiomas
  end

  def show
    idioma = V1::Idioma.find(params[:id])
    render json: idioma
  end

  def create
    idioma = V1::Idioma.new(idioma_params)
    idioma.save
    render Serializer.run(idioma)
  end

  def add_to_pessoa
    
    result = Idiomas::AddToPessoa.call(pessoa_id: params[:pessoa_id], params: idioma_params)
    render json: result.data, status: result.status
  end

  private

  # Only allow a list of trusted parameters through.
  def idioma_params
    params.require(:idioma).permit(:id, :nome)
  end
end
