class Pessoas::GetAll
  include Interactor

  def call
    context.data = V1::Pessoa.limit(context.per_page).offset(context.page)
  end
end
