class Candidaturas::Show
  include Interactor

  def call
    context.data = V1::Candidatura.find context.id
    context.status = :ok
  end
end
