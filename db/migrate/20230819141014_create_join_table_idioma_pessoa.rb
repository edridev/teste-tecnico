class CreateJoinTableIdiomaPessoa < ActiveRecord::Migration[7.0]
  def change
    create_join_table :idiomas, :pessoas do |t|
      t.index [:idioma_id, :pessoa_id]
      t.index [:pessoa_id]
    end
  end
end
