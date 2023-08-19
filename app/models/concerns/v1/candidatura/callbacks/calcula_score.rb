module V1::Candidatura::Callbacks::CalculaScore
  extend ActiveSupport::Concern

  private

  def calcula_score
    v_experiencia = pessoa.experiencia
    v_titulo = vaga.titulo
    unless match_experiencia?(v_experiencia, v_titulo)
      self.score = 0
      return
    end

    unless match_idioma?
      self.score = 0
      return
    end

    graph = Graphs::Dijkstra.new
    data = graph.run pessoa.localizacao, vaga.localizacao
    self.percurso = data[:route]
    self.distancia = data[:cost]

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
