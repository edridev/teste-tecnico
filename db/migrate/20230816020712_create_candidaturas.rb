class CreateCandidaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :candidaturas do |t|
      t.integer :id_pessoa, foreign_key: { to_table: :pessoas }
      t.integer :id_vaga, foreign_key: { to_table: :vagas }
    end
  end
end
