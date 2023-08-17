class Linguas::Index < BaseInteractor
  def call
    context.linguas = context.pessoa.linguas
    context.status = :ok
  end
end
