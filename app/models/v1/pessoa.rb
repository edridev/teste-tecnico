class V1::Pessoa < ApplicationRecord
  VALID_SCORE = [0, 25, 50, 75, 100]
  VALID_LOCALIZACAO = %w[A B C D E F]
  VALID_NIVEL = {
    'estagiário' => 1,
    'júnior' => 2,
    'pleno' => 3,
    'sênior' => 4,
    'especialista' => 5
  }

  has_many :candidaturas, foreign_key: :id_pessoa
  has_many :vagas, through: :candidaturas

  validates_presence_of :nome, :profissao, :localizacao, :nivel, :score

  validates_inclusion_of :score, in: VALID_SCORE

  validates_inclusion_of :localizacao, in: VALID_LOCALIZACAO

  enum nivel: VALID_NIVEL
end
