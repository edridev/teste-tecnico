require 'rails_helper'

RSpec.describe V1::Idioma, type: :model do
  subject { build(:idioma) }

  describe 'validations' do
    it { should validate_presence_of(:nome) }
  end
end
