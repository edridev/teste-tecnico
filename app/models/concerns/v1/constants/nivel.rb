module Concerns::V1::Constants::Nivel
  extend ActiveSupport::Concern

  EXPERIENCIA_NIVEIS = {
    1 => 'estagiário',
    2 => 'júnior',
    3 => 'pleno',
    4 => 'sênior',
    5 => 'especialista'
  }
end
