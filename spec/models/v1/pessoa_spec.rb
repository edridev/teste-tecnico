require 'rails_helper'

RSpec.describe V1::Pessoa, type: :model do
  subject { build(:pessoa) }

  describe 'associations' do
    it { should have_many(:linguas).with_foreign_key('id_pessoa') }
    it { should have_many(:candidaturas).with_foreign_key('id_pessoa') }
    it { should have_many(:vagas).through(:candidaturas) }
    it { should validate_uniqueness_of(:nome) }
    it do
      should validate_inclusion_of(:nivel).in_range(1..5)
    end
    it do
      should validate_inclusion_of(:localizacao).in_array(V1::Pessoa::VALID_LOCALIZACAO)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:nome) }

    it { should validate_presence_of(:profissao) }

    it { should validate_presence_of(:localizacao) }

    it { should validate_presence_of(:nivel) }

    it { should validate_presence_of(:score) }
  end
end
