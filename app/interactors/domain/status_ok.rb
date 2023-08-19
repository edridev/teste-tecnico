class Domain::StatusOk
  include Interactor

  def call
    context.status = :ok
  end
end
