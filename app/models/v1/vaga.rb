class V1::Vaga < ApplicationRecord
  VALID_LOCALIZACAO = %w[A B C D E F]
  NIVEIS = {
    1 => 'estagiário',
    2 => 'júnior',
    3 => 'pleno',
    4 => 'sênior',
    5 => 'especialista'
  }

  has_many :candidaturas, foreign_key: 'id_vaga'
  has_many :pessoas, through: :candidaturas

  validates_presence_of :empresa, :titulo, :descricao, :localizacao, :nivel

  validates_inclusion_of :localizacao, in: VALID_LOCALIZACAO
  validates_inclusion_of :nivel, in: 1..5

  validates_uniqueness_of :titulo, scope: :empresa
end
