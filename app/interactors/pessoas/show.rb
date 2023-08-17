class Pessoas::Show
  include Interactor

  def call
    context.pessoa = V1::Vaga.find(context.id)
    context.status = :ok
  end
end
