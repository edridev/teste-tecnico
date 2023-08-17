class Linguas::Show
  include Interactor

  def call
    lingua = context.pessoa.linguas.find(context.id)
    context.lingua = lingua
    context.status = :ok
  end
end
