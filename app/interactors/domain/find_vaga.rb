class Domain::FindVaga
  include Interactor

  def call
    context.vaga = V1::Vaga.find(context.id)
  end
end
