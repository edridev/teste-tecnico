require 'rails_helper'

RSpec.describe V1::Pessoa, type: :model do

  it { should have_many(:candidaturas).with_foreign_key('id_vaga') }

  it { should have_many(:pessoas).through(:candidaturas) }

  it { should validate_presence_of(:nome) }

  it { should validate_presence_of(:profissao) }

  it { should validate_presence_of(:localizacao) }

  it { should validate_presence_of(:nivel) }

  it { should validate_presence_of(:score) }

  it do
    should validate_inclusion_of(:localizacao).in_array(['A','B','C','D','E','F'])
  end

  it do
    should define_enum_for(:nivel).with_values(
        'estagiário' => 1,
        'júnior' => 2,
        'pleno' => 3,
        'sênior' => 4,
        'especialista' => 5
      )
  end

end
