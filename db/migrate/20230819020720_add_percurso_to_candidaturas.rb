class AddPercursoToCandidaturas < ActiveRecord::Migration[7.0]
  def change
    add_column :candidaturas, :percurso, :string
  end
end
