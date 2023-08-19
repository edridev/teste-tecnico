class Domain::SetPagination
  include Interactor

  def call
    context.page = context.page.to_i.zero? ? 0 : context.page.to_i - 1
    context.page = context.per_page.to_i * context.page + 1
  end
end
