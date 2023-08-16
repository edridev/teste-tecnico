class CreateVagas < ActiveRecord::Migration[7.0]
  def change
    create_table :vagas do |t|
      t.string :empresa
      t.string :titulo
      t.string :descricao
      t.integer :localizacao
      t.integer :nivel

      t.timestamps
    end
  end
end
