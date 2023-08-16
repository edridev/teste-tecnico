class CreateJoinTablePessoaVaga < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pessoas, :vagas do |t|
      t.index [:pessoa_id, :vaga_id]
      t.index [:vaga_id, :pessoa_id]
    end
  end
end
