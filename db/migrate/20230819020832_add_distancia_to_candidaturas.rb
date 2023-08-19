class AddDistanciaToCandidaturas < ActiveRecord::Migration[7.0]
  def change
    add_column :candidaturas, :distancia, :integer
  end
end
