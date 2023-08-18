class CreateLinguas < ActiveRecord::Migration[7.0]
  def change
    create_table :linguas do |t|
      t.integer :id_pessoa, index: true
      t.integer :id_idioma, index: true
      t.string :grau

      t.timestamps
    end
    add_foreign_key :linguas, :pessoas, column: :id_pessoa
    add_foreign_key :linguas, :idiomas, column: :id_idioma
  end
end
