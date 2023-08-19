class Candidaturas::Ranking
  include Interactor

  def call
    cols = Domain::CandidaturaSelect.call.columns
    context.data = V1::Candidatura.joins(:pessoa).select(cols)
                                  .where('candidaturas.id_vaga = ?', context.id)
                                  .order('candidaturas.score desc')

    context.status = :ok
  end
end
