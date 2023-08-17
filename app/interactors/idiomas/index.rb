class Idiomas::Index < BaseInteractor
  def call
    pessoa = V1::Pessoa.find(context.id)
    context.idiomas = pessoa.idiomas.all
    context.status = :ok
  end
end
