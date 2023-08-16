class V1::Vaga < ApplicationRecord
    has_and_belongs_to_many :pessoas
end
