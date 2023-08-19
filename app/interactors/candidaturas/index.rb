class Candidaturas::Index
  include Interactor

  def call
    context.data = V1::Candidatura.all
    context.status = :ok
  end

end
