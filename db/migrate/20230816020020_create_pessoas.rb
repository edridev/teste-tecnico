class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :profissao
      t.string :localizacao
      t.integer :nivel

      t.timestamps
    end
  end
end
