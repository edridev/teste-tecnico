class Idiomas::Show
  include Interactor

  def call
    context.data = V1::Idioma.find(context.id)
    context.status = :ok
  end
end
