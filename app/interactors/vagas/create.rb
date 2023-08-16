class Vagas::Create < BaseInteractor
  def call
    vaga = V1::Vaga.create(context.params)
    context.vaga = build_response vaga
    context.status = vaga.valid? ? :unprocessable_entity : :ok
  end
end
