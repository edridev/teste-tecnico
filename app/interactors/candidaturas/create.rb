class Candidaturas::Create < BaseInteractor
  def call
    candidatura = V1::Candidatura.new(context.params)
    context.candidatura = if candidatura.save
                     success_response(candidatura, :ok)
                   else
                     invalidated_response(candidatura)
                   end
    context.status = candidatura.valid? ? :unprocessable_entity : :ok
  end
end
