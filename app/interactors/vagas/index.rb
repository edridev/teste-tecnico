class Vagas::Index < BaseInteractor
  def call
    context.vagas = V1::Vaga.all
    context.status = :ok
  end
end
