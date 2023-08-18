require 'rails_helper'

RSpec.describe V1::Pessoa, type: :model do
  subject { build(:pessoa) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
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
    it 'is not valid without a score' do
      subject.score = nil
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
    it 'has many linguas' do
      pessoa = create(:pessoa)
      3.times do
        pessoa.linguas.build build(:lingua, :with_idioma).as_json
      end
      pessoa.save
      expect(pessoa.linguas.count).to eq(3)
    end

    it 'has many idiomas through linguas' do
      pessoa = create(:pessoa)
      3.times do
        pessoa.linguas.build build(:lingua, :with_idioma).as_json
      end
      pessoa.save
      expect(pessoa.linguas.count).to eq(pessoa.idiomas.count)
    end

    it 'has many candidaturas' do
      pessoa = create(:pessoa)
      3.times do
        jrow = build(:candidatura, :with_vaga).as_json.compact
        pessoa.candidaturas.create(jrow)
      end
      expect(pessoa.candidaturas.count).to eq(3)
    end

    it 'has many vagas through candidaturas' do
      pessoa = create(:pessoa)
      3.times do
        jrow = build(:candidatura, :with_vaga).as_json.compact
        pessoa.candidaturas.create(jrow)
      end
      expect(pessoa.candidaturas.count).to eq(pessoa.vagas.count)
    end
  end
end
