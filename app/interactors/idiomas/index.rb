class Idiomas::Index
  include Interactor

  def call
    context.data = V1::Idioma.all
    context.status = :ok
  end
end
