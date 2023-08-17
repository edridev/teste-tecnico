class Pessoas::Index < BaseInteractor
  def call
    context.pessoas = build_response V1::Pessoa.all
    context.status = :ok
  end
end
