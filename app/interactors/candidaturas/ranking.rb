class Candidaturas::Ranking < BaseInteractor
  def call
    vaga = V1::Vaga.find(context.id)
    context.candidaturas = vaga.pessoas.all
    context.status = :ok
  end
end
