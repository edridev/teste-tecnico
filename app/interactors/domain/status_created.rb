class Domain::StatusCreated
  include Interactor

  def call
    context.status = :created
  end
end
