require 'rails_helper'

RSpec.describe V1::Pessoa, type: :model do
  subject { build(:pessoa) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a experiencia' do
      subject.experiencia = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a nome' do
      subject.nome = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a profissao' do
      subject.profissao = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a localizacao' do
      subject.localizacao = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a nivel' do
      subject.nivel = nil
      expect(subject).to_not be_valid
    end

    it 'if invalid when nivel is out of range(1..5)' do
      subject.nivel = 6
      expect(subject).to_not be_valid
    end

    it 'if invalid when localizacao is out of range(1..5)' do
      subject.localizacao = 'Z'
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate nome' do
      create(:pessoa, nome: subject.nome)
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many candidaturas' do
      pessoa = create(:pessoa)
      3.times do
        jrow = build(:candidatura, id_pessoa: nil).as_json.compact
        pessoa.candidaturas.create(jrow)
      end
      expect(pessoa.candidaturas.count).to eq(3)
    end

    it 'has many vagas through candidaturas' do
      pessoa = create(:pessoa)
      3.times do
        jrow = build(:candidatura, id_pessoa: nil).as_json.compact
        pessoa.candidaturas.create(jrow)
      end
      expect(pessoa.candidaturas.count).to eq(pessoa.vagas.count)
    end

    it 'has and belongs to many idiomas' do
      pessoas = create(:pessoa)
      expect(pessoas.idiomas.count).to eq(0)
      pessoas.idiomas << create_list(:idioma, 3)
      expect(pessoas.idiomas.count).to eq(3)
    end
  end
end
