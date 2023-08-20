class V1::Idioma < ApplicationRecord
  include V1::Domain::Pagination

  validates :nome, presence: true, uniqueness: true

  has_and_belongs_to_many :pessoas
end
