class Vagas::Show
  include Interactor

  def call
    context.vaga = V1::Vaga.find(context.id)
    context.status = :ok
  end
  
end
