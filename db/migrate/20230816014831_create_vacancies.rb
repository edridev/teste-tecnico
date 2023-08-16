class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.string :company
      t.string :title
      t.string :description
      t.integer :location
      t.integer :level

      t.timestamps
    end
  end
end
