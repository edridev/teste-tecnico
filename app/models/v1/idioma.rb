class V1::Idioma < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
end
