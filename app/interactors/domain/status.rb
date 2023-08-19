class Domain::Status
  include Interactor

  def call
    context.status = context.data.valid? ? :created : :unprocessable_entity
  end
end
