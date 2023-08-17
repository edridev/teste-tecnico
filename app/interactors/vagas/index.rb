class Vagas::Index < BaseInteractor
  def call
    context.vagas = build_response V1::Vaga.all
    context.status = :ok
  end
end
