require 'rails_helper'

RSpec.describe V1::Vaga, type: :model do
  subject { build(:vaga) }

  describe 'associations' do
    it { should have_many(:candidaturas).with_foreign_key('id_vaga') }
    it { should have_many(:pessoas).through(:candidaturas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:empresa) }

    it { should validate_presence_of(:titulo) }

    it { should validate_presence_of(:descricao) }

    it { should validate_presence_of(:localizacao) }

    it { should validate_presence_of(:nivel) }

    it { should validate_uniqueness_of(:titulo).scoped_to(:empresa) }

    it do
      should validate_inclusion_of(:nivel).in_range(1..5)
    end

    it do
      should validate_inclusion_of(:localizacao).in_array(%w[A B C D E F])
    end
  end
end
