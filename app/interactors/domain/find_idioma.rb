class Domain::FindIdioma
  include Interactor

  def call
    context.idioma = V1::Idioma.find(context.id)
  end
end
