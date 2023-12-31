class V1::PessoasController < V1::ApiController
  def index
    sort = params[:sort] || default_sort
    pessoas = V1::Pessoa.page(page: params[:page], per_page: params[:per_page]).order(sort)

    render json: pessoas
  end

  def show
    pessoa = V1::Pessoa.find(params[:id])
    render json: pessoa
  end

  def create
    pessoa = V1::Pessoa.new(pessoa_params)
    pessoa.save
    render Serializer.run(pessoa)
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:nome, :profissao, :localizacao, :nivel, :experiencia, :distancia_maxima,
                                   :idioma_id, idioma_ids: [])
  end
end
