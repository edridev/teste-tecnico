class Candidaturas::Show
  include Interactor

  def call
    candidatura = V1::Candidatura.find context.id
    context.candidatura = candidatura
    context.status = :ok
  end

end
