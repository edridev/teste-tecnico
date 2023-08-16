class V1::Pessoa < ApplicationRecord
    has_and_belongs_to_many :vagas
end
