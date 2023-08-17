class Pessoas::Create < BaseInteractor
  def call
    pessoa = V1::Pessoa.create(context.params)
    context.pessoa = build_response pessoa
    context.status = pessoa.valid? ? :created : :unprocessable_entity
  end
end
