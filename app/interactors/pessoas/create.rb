class Pessoas::Create < BaseInteractor
  def call
    pessoa = V1::Pessoa.new(context.params)
    context.pessoa = if pessoa.save
                     success_response(pessoa, :ok)
                   else
                     invalidated_response(pessoa)
                   end
    context.status = pessoa.valid? ? :unprocessable_entity : :ok
  end
end
