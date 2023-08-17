class CreateLinguas < ActiveRecord::Migration[7.0]
  def change
    create_table :linguas do |t|
      t.string :id_pessoa
      t.string :id_idioma
      t.string :grau

      t.timestamps
    end
  end
end
