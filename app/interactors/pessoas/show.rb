class Pessoas::Show
  include Interactor

  def call
    context.pessoa = V1::Pessoa.find(context.id)
    context.status = :ok
  end
end
