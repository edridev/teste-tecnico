class V1::Idioma < ApplicationRecord
  validates :nome, presence: true, uniqueness: true

  has_many :linguas, foreign_key: :id_idioma
  has_many :pessoas, through: :linguas
end
