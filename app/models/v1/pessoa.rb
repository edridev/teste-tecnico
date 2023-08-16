class V1::Pessoa < ApplicationRecord
  has_many :candidaturas, foreign_key: :id_pessoa
  has_many :vagas, through: :candidaturas
end
