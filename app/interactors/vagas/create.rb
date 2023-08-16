class Vagas::Create < BaseInteractor
  def call
    vaga = V1::Vaga.new(context.params)
    context.vaga = if vaga.save
                     success_response(vaga, :ok)
                   else
                     invalidated_response(vaga)
                   end
    context.status = vaga.valid? ? :unprocessable_entity : :ok
  end
end
