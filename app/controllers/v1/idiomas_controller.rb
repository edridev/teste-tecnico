class V1::IdiomasController < V1::ApiController
  def index
    result = Idiomas::Index.call page: params[:page], per_page: params[:per_page]
    render json: result.data, status: result.status
  end

  def show
    result = Idiomas::Show.call(id: params[:id])
    render json: result.data, status: result.status
  end

  def create
    result = Idiomas::Create.call(params: idioma_params)
    render json: result.data, status: result.status
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
