class V1::Vaga < ApplicationRecord
  has_many :candidaturas, foreign_key: :id_vaga
  has_many :pessoas, through: :candidaturas
end
