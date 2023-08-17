class CreateCandidaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :candidaturas do |t|
      t.integer :id_pessoa, index: true
      t.integer :id_vaga, index: true

      t.timestamps
    end
    add_foreign_key :candidaturas, :pessoas, column: :id_pessoa
    add_foreign_key :candidaturas, :vagas, column: :id_vaga
  end
end
