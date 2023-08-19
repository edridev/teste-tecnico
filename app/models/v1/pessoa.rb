class V1::Pessoa < ApplicationRecord
  VALID_LOCALIZACAO = %w[A B C D E F]
  NIVEIS = {
    1 => 'estagiário',
    2 => 'júnior',
    3 => 'pleno',
    4 => 'sênior',
    5 => 'especialista'
  }

  has_many :candidaturas, foreign_key: :id_pessoa
  has_many :vagas, through: :candidaturas

  has_and_belongs_to_many :idiomas

  validates_presence_of :nome, :profissao, :localizacao, :nivel, :experiencia

  validates_inclusion_of :localizacao, in: VALID_LOCALIZACAO

  validates_inclusion_of :nivel, in: 1..5

  validates_uniqueness_of :nome
  
end
