class AddExperienciaToPessoas < ActiveRecord::Migration[7.0]
  def change
    add_column :pessoas, :experiencia, :text
  end
end
