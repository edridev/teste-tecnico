class Vagas::Show
  include Interactor

  def call
    context.data = V1::Vaga.find(context.id)
    context.status = :ok
  end
end
