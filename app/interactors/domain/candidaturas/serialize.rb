class Domain::Candidaturas::Serialize
  include Interactor

  def call
    context.candidaturas = context.data.map do |data|
      {
        empresa: data.vaga.empresa,
        titulo: data.vaga.titulo,
        nome: data.pessoa.nome,
        profissao: data.pessoa.profissao,
        localizacao: data.pessoa.localizacao,
        nivel: data.pessoa.nivel,
        score: data.pessoa.score,
        created_at: data.created_at,
        updated_at: data.updated_at
      }
    end
  end

end
