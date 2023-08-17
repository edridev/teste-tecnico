class Candidaturas::Index < BaseInteractor
  def call
    candidaturas = V1::Candidatura.includes(:pessoa, :vaga).order('vagas.empresa, pessoas.nome')
    result = Domain::Candidaturas::Serialize.call(data: candidaturas)
    context.candidaturas = build_response result.candidaturas
    context.status = :ok
  end
end
