# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_16_020712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidaturas", force: :cascade do |t|
    t.integer "id_pessoa"
    t.integer "id_vaga"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "profissao"
    t.string "localizacao"
    t.integer "nivel"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vagas", force: :cascade do |t|
    t.string "empresa"
    t.string "titulo"
    t.string "descricao"
    t.integer "localizacao"
    t.integer "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
