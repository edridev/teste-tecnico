class V1::PessoasController < ApplicationController

  def create
    @pessoa = V1::Pessoa.new(pessoa_params)
    if @pessoa.save
      render json: @pessoa, status: :created, location: @pessoa
    else
      render json: @pessoa.errors, status: :unprocessable_entity
    end
  end

  private
    def pessoa_params
      params.require(:pessoa).permit(:nome, :profissao, :localizacao, :nivel, :score)
    end
end
