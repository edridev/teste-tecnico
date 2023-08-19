class Candidaturas::Create
  include Interactor

  def call
    data = V1::Candidatura.create(context.params)
    context.data = Domain::Response.call(data:).body
    context.status = Domain::Status.call(data:).status
  end
end
