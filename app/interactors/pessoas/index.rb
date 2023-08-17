class Pessoas::Index < BaseInteractor
  def call
    context.pessoas = V1::Pessoa.all
    context.status = :ok
  end
end
