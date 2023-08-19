class AddScoreToCandidaturas < ActiveRecord::Migration[7.0]
  def change
    add_column :candidaturas, :score, :integer
  end
end
