class Candidaturas::Index < BaseInteractor
  def call
    candidaturas = V1::Candidatura.includes(:pessoa, :vaga).order('vagas.empresa, pessoas.nome')
    context.candidaturas = Domain::Candidaturas::Serialize.call(data: candidaturas)
    context.status = :ok
  end
end
