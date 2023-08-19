require 'rails_helper'

RSpec.describe V1::Candidatura, type: :model do
  subject { build(:candidatura) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a id_pessoa' do
      subject.id_pessoa = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a id_vaga' do
      subject.id_vaga = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a score' do
      subject.score = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate id_pessoa/id_vaga' do
      create(:candidatura, id_pessoa: subject.id_pessoa, id_vaga: subject.id_vaga)
      expect(subject).to_not be_valid
    end
  end

  describe 'score calculates' do
    it 'is score must be calculated correctly' do
      vaga = create(:vaga, localizacao: 'C', nivel: 4)
      pessoa = create(:pessoa, localizacao: 'F', nivel: 5)
      pessoa.idiomas << vaga.idioma
      candidatura = create(:candidatura, id_vaga: vaga.id, id_pessoa: pessoa.id)
      nivel = calc_nivel(vaga.nivel, pessoa.nivel)
      dist = calc_distancia(candidatura.distancia)
      score = (nivel + dist) / 2
      expect(candidatura.percurso).to eq('F --> D --> B --> C')
      expect(candidatura.distancia).to eq(18)
      expect(candidatura.score).to eq(score)
    end

    it 'the score is zero when the language does not match that required by the vacancy' do
      vaga = create(:vaga, localizacao: 'C', nivel: 4)
      pessoa = create(:pessoa, localizacao: 'F', nivel: 5)
      candidatura = create(:candidatura, id_vaga: vaga.id, id_pessoa: pessoa.id)
      expect(candidatura.score).to eq(0)
    end

    it 'the candidate''s experience does not match that of the vacancy' do
      vaga = create(:vaga, localizacao: 'C', nivel: 4)
      pessoa = create(:pessoa, localizacao: 'F', nivel: 5, experiencia: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum')
      pessoa.idiomas << vaga.idioma
      candidatura = create(:candidatura, id_vaga: vaga.id, id_pessoa: pessoa.id)
      expect(candidatura.score).to eq(0)
    end
  end

  describe 'associations' do
    it 'belongs to pessoa' do
      expect(subject.respond_to?(:pessoa)).to be true
      pessoa = create(:pessoa)
      cand = create(:candidatura, id_pessoa: pessoa.id, id_vaga: create(:vaga).id)
      expect(cand.pessoa).to eq(pessoa)
    end

    it 'belongs to vaga' do
      expect(subject.respond_to?(:vaga)).to be true
      vaga = create(:vaga)
      cand = create(:candidatura, id_vaga: vaga.id, id_pessoa: create(:pessoa).id)
      expect(cand.vaga).to eq(vaga)
    end
  end
end

def calc_nivel(nvaga, npessoa)
  n = nvaga - npessoa
  n = n.negative? ? 0 : n
  [100, 75, 50, 25, 0][n]
end

def calc_distancia(distancia)
  case distancia
  when 0..5
    100
  when 6..10
    75
  when 10..15
    50
  when 16..20
    25
  else
    0
  end
end

def match_experiencia?(exp, tit)
  exp.gsub(' ', '').downcase.include?(tit.gsub(' ', '').downcase)
end
