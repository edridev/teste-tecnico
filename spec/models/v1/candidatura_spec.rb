require 'rails_helper'

RSpec.describe V1::Candidatura, type: :model do
  subject { build(:candidatura) }

  describe 'validations' do
    it { should validate_presence_of(:id_pessoa) }
    it { should validate_presence_of(:id_vaga) }
    it { should validate_uniqueness_of(:id_pessoa).scoped_to(:id_vaga) }
  end

  describe 'associations' do
    it { should belong_to(:pessoa).with_foreign_key('id_pessoa') }
    it { should belong_to(:vaga).with_foreign_key('id_vaga') }
  end

end
