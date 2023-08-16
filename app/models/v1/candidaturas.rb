class V1::Candidatura < ApplicationRecord
  has_one :pessoa, foreign_key: :id_pessoa
  has_one :vaga, foreign_key: :id_vaga

  validates_presence_of :id_pessoa, :id_vaga

end
