class Linguas::Create < BaseInteractor
  def call
    lingua = pessoa.linguas.create(context.params)
    context.lingua = build_response lingua
    context.status = lingua.valid? ? :created : :unprocessable_entity
  end
end
