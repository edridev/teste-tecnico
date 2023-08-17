require 'rails_helper'

RSpec.describe Lingua, type: :model do
  subject { build(:lingua) }

  describe 'validations' do
    it { should validate_presence_of(:id_pessoa) }
    it { should validate_presence_of(:id_idioma) }
    it { should validate_presence_of(:grau) }
    it do
      should validate_inclusion_of(:grau).in_array(V1::Idioma::LEVEL_IDIOMAS)
    end
  end

  describe 'associations' do
    it { should belong_to(:pessoa).with_foreign_key('id_pessoa') }
    it { should belong_to(:idioma).with_foreign_key('id_idioma') }
  end
end
