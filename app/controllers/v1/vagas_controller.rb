class V1::VagasController < V1::ApiController

  def index
    vagas = V1::Vaga.all

    render json: vagas
  end

  def show
    vaga = V1::Vaga.find(params[:id])
    render json: vaga
  end

  def create
    vaga = V1::Vaga.new(vaga_params)
    vaga.save
    render Serializer.run(vaga)
  end

  private

  # Only allow a list of trusted parameters through.
  def vaga_params
    params.require(:vaga).permit(:empresa, :titulo, :descricao, :localizacao, :nivel, :idioma_id)
  end
end
