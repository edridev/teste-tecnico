class V1::Candidatura < ApplicationRecord
  include V1::Candidatura::Callbacks::CalculaScore

  before_save :calcula_score
  after_initialize :set_defaults

  belongs_to :pessoa, foreign_key: :id_pessoa
  belongs_to :vaga, foreign_key: :id_vaga

  validates_presence_of :id_pessoa, :id_vaga, :score
  validates_uniqueness_of :id_pessoa, scope: :id_vaga


  def set_defaults
    self.score = 0
  end
end
