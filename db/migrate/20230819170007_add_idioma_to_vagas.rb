class AddIdiomaToVagas < ActiveRecord::Migration[7.0]
  def change
    add_column :vagas, :idioma_id, :integer
    add_index :vagas, :idioma_id
  end
end
