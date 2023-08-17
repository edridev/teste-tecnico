class CreateIdiomas < ActiveRecord::Migration[7.0]
  def change
    create_table :idiomas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
