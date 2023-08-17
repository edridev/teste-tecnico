class V1::Pessoa < ApplicationRecord
  VALID_SCORE = [0, 25, 50, 75, 100]
  VALID_LOCALIZACAO = %w[A B C D E F]
  NIVEIS = {
    1 => 'estagiário',
    2 => 'júnior',
    3 => 'pleno',
    4 => 'sênior',
    5 => 'especialista'
  }

  after_initialize :set_defaults

  has_many :candidaturas, foreign_key: :id_pessoa
  has_many :vagas, through: :candidaturas

  has_many :linguas, foreign_key: 'id_pessoa'

  validates_presence_of :nome, :profissao, :localizacao, :nivel, :score

  validates_inclusion_of :score, in: VALID_SCORE

  validates_inclusion_of :localizacao, in: VALID_LOCALIZACAO

  validates_inclusion_of :nivel, in: 1..5

  def set_defaults
    self.score = 0
  end
end
