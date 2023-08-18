class AddDistanciaMaximaToPessoas < ActiveRecord::Migration[7.0]
  def change
    add_column :pessoas, :distancia_maxima, :integer
  end
end
