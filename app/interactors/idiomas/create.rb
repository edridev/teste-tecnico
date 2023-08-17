class Idiomas::Create < BaseInteractor
  def call
    idioma = V1::Idioma.create(context.params)
    context.idioma = build_response idioma
    context.status = idioma.valid? ? :created : :unprocessable_entity
  end
end
