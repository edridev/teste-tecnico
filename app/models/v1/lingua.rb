class V1::Lingua < ApplicationRecord
  LEVEL_IDIOMAS = ['Básico','Técnico','Intermediario','Fluente','Proficiente']
  belongs_to :idioma, foreign_key: 'id_idioma'
  belongs_to :pessoa, foreign_key: 'id_pessoa'

  validates_presence_of :id_pessoa, :id_idioma, :grau

  validates_inclusion_of :grau, in: LEVEL_IDIOMAS
  
end
