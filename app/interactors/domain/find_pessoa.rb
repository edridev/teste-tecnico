class Domain::FindPessoa
  include Interactor

  def call
    context.pessoa = V1::Pessoa.find(context.id)
  end
end
