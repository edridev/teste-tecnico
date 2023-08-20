module V1::Candidatura::Callbacks::CalculaScore
  extend ActiveSupport::Concern

  def calcula_score
    v_experiencia = pessoa.experiencia
    v_titulo = vaga.titulo
    unless match_experiencia?(v_experiencia, v_titulo)
      self.score = 0
      self.motivo = 'A experiência do usuário não contempla o título da vaga.'
      return
    end

    unless match_idioma?
      self.score = 0
      self.motivo = 'Candidato não possui o idioma solicitado na vaga.'
      return
    end

    graph = Graphs::Dijkstra.new
    data = graph.run pessoa.localizacao, vaga.localizacao
    self.percurso = data[:route]
    self.distancia = data[:cost]

    if distancia > pessoa.distancia_maxima
      self.score = 0
      self.motivo = 'Distância cálculada ultrapassa a distância máxima do candidato.'
      return
    end

    result = (calc_nivel + calc_distancia) / 2

    self.score = result
  end

  def match_experiencia?(exp, tit)
    exp.gsub(' ', '').downcase.include?(tit.gsub(' ', '').downcase)
  end

  def match_idioma?
    return true unless vaga.idioma.present?
    return false unless pessoa.idiomas.any?

    pessoa.idiomas.include?(vaga.idioma)
  end

  def calc_nivel
    n = vaga.nivel - pessoa.nivel
    n = n.negative? ? 0 : n
    [100, 75, 50, 25, 0][n]
  end

  def calc_distancia
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
  
end
