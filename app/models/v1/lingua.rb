class V1::Lingua < ApplicationRecord
  LEVEL_IDIOMAS = %w[Básico Técnico Intermediario Fluente Proficiente]
  belongs_to :idioma, foreign_key: 'id_idioma'
  belongs_to :pessoa, foreign_key: 'id_pessoa'

  validates_presence_of :id_pessoa, :id_idioma, :grau

  validates_inclusion_of :grau, in: LEVEL_IDIOMAS

  validates_inclusion_of :attribute, in: %w( mov avi ), on: :create, message: "extension %s is not included in the list"

  validates_uniqueness_of :id_pessoa, scope: :id_idioma, case_sensitive: true
end
