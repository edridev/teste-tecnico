class Idiomas::AddToPessoa
  include Interactor

  def call
    pes = Domain::FindPessoa.call id: context.pessoa_id
    idio = Domain::FindIdioma.call id: context.params[:id]
    data = pes.pessoa.idiomas << idio.idioma
    context.data = Domain::Response.call(parent: pes.pessoa, data:).body
    context.status = Domain::Status.call(data: pes.pessoa).status
  end
end
