class Idiomas::Show
  include Interactor

  def call
    pessoa = V1::Pessoa.find(context.id)
    context.idioma = pessoa.find(context.id)
    context.status = :ok
  end
end
