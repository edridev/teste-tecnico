require 'rails_helper'

RSpec.describe V1::Candidatura, type: :model do

  it { should validate_presence_of(:id_pessoa) }
  it { should validate_presence_of(:id_vaga) }

  it { should have_one(:pessoa).with_foreign_key('id_pessoa') }
  it { should have_one(:vaga).with_foreign_key('id_vaga') }

end
