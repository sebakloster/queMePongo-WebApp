# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200614224241) do

  create_table "atuendos", force: :cascade do |t|
    t.integer "torso_id"
    t.integer "cabeza_id"
    t.integer "piernas_id"
    t.integer "pies_id"
    t.integer "puntaje"
    t.integer "etiqueta_estacion"
    t.integer "etiqueta_tiempo"
    t.integer "etiqueta_formalidad"
    t.text "descripcion"
    t.index ["cabeza_id"], name: "index_atuendos_on_cabeza_id"
    t.index ["piernas_id"], name: "index_atuendos_on_piernas_id"
    t.index ["pies_id"], name: "index_atuendos_on_pies_id"
    t.index ["torso_id"], name: "index_atuendos_on_torso_id"
  end

  create_table "guardarropas", force: :cascade do |t|
    t.string "name"
  end

  create_table "prenda_tipos", force: :cascade do |t|
    t.integer "categoria"
    t.integer "tipo"
  end

  create_table "prendas", force: :cascade do |t|
    t.integer "categoria"
    t.string "color_primario"
    t.string "color_secundario"
    t.integer "prenda_tipo_id"
    t.integer "guardarropa_id"
    t.integer "tela"
    t.index ["guardarropa_id"], name: "index_prendas_on_guardarropa_id"
    t.index ["prenda_tipo_id"], name: "index_prendas_on_prenda_tipo_id"
  end

end
