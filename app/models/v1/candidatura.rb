class V1::Candidatura < ApplicationRecord
  include V1::Domain::Pagination
  include V1::Candidatura::Callbacks::CalculaScore

  before_validation :calcula_score

  belongs_to :pessoa, foreign_key: :id_pessoa
  belongs_to :vaga, foreign_key: :id_vaga

  validates_presence_of :id_pessoa, :id_vaga, :score
  validates_uniqueness_of :id_pessoa, scope: :id_vaga

  scope :ranking, lambda { |vaga_id|
    joins(:pessoa).select(
      'candidaturas.id', 'pessoas.nome',
      'pessoas.profissao', 'pessoas.localizacao',
      'pessoas.nivel', 'candidaturas.score',
      'candidaturas.created_at', 'candidaturas.updated_at'
    ).where('candidaturas.id_vaga = ?', vaga_id).order('candidaturas.score desc')
  }
end
