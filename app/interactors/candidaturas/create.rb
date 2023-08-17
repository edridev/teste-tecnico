class Candidaturas::Create < BaseInteractor
  def call
    candidatura = V1::Candidatura.create(context.params)
    context.candidatura = build_response candidatura
    context.status = candidatura.valid? ? :created : :unprocessable_entity
  end
end
