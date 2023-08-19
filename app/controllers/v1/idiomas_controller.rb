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
    pessoa = V1::Pessoa.find params[:pessoa_id]
    idioma = pessoa.idiomas << V1::Idioma.find(idioma_params[:id])
    render Serializer.run(idioma)
  end

  private

  def idioma_params
    params.require(:idioma).permit(:id, :nome)
  end
end
