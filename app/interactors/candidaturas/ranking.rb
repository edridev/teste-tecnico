class Candidaturas::Ranking < BaseInteractor

  def call
    candidaturas = V1::Candidatura.join(:pessoas).select(cols)
      .where('candidaturas.id_vaga = ?', context.id)
        .order('pessoas.score desc')

    context.candidaturas = candidaturas

    context.status = :ok
  end

  private

  def cols
    [
      'candidaturas.id',
      'pessoas.nome',
      'pessoas.profissao',
      'pessoas.localizacao',
      'pessoas.nivel',
      'pessoas.score',
      'candidaturas.created_at',
      'candidaturas.updated_at'
    ]
  end


end
