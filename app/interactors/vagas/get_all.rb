class Vagas::GetAll
  include Interactor

  def call
    context.data = V1::Vaga.limit(context.per_page).offset(context.page)
  end
end
