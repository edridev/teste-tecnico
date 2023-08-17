class Idiomas::Index < BaseInteractor
  def call
    context.idiomas = V1::Idioma.all
    context.status = :ok
  end
end
