class Domain::CandidaturaSelect
  include Interactor

  def call
    context.columns = [
      'candidaturas.id',
      'pessoas.nome',
      'pessoas.profissao',
      'pessoas.localizacao',
      'pessoas.nivel',
      'candidaturas.score',
      'candidaturas.created_at',
      'candidaturas.updated_at'
    ]
  end
end
