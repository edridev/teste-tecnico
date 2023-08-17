class V1::IdiomasController < V1::ApiController
  def index
    result = Idiomas::Index.call
    render json: result.idiomas, status: result.status
  end

  def show
    result = Idiomas::Show.call(id: params[:id])
    render json: result.idioma, status: result.status
  end

  def create
    result = Idiomas::Create.call(params: idioma_params)
    render json: result.idioma, status: result.status
  end

  private

  # Only allow a list of trusted parameters through.
  def idioma_params
    params.require(:idioma).permit(:nome)
  end
end
