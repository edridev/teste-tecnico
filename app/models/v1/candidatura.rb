class V1::Candidatura < ApplicationRecord
  belongs_to :pessoa, foreign_key: :id_pessoa
  belongs_to :vaga, foreign_key: :id_vaga

  validates_presence_of :id_pessoa, :id_vaga
end
