class Candidaturas::Index
  include Interactor

  def call
    candidaturas = V1::Candidatura.all
    context.candidaturas = candidaturas
    context.status = :ok
  end

end
