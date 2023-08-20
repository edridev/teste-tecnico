class AddMotivoToCandidatura < ActiveRecord::Migration[7.0]
  def change
    add_column :candidaturas, :motivo, :string
  end
end
