class V1::Vaga < ApplicationRecord
  VALID_LOCALIZACAO = %w[A B C D E F]
  VALID_NIVEL = {
    'estagiário' => 1,
    'júnior' => 2,
    'pleno' => 3,
    'sênior' => 4,
    'especialista' => 5
  }

  has_many :candidaturas, foreign_key: :id_vaga
  has_many :pessoas, through: :candidaturas

  validates_presence_of :empresa, :titulo, :descricao, :localizacao, :nivel

  validates_inclusion_of :localizacao, in: VALID_LOCALIZACAO

  enum nivel: VALID_NIVEL

end
