# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130602003208) do

  create_table "apartamentos", :force => true do |t|
    t.integer  "numero"
    t.integer  "bloco"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "apartamentos_leituras", :force => true do |t|
    t.integer  "apartamento_id"
    t.integer  "leitura_id"
    t.float    "leitura_apartamento"
    t.float    "consumo"
    t.float    "valor"
    t.date     "data"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.float    "diferenca_ajustada"
    t.float    "porcentagem"
  end

  add_index "apartamentos_leituras", ["apartamento_id"], :name => "index_apartamentos_leituras_on_apartamento_id"
  add_index "apartamentos_leituras", ["leitura_id"], :name => "index_apartamentos_leituras_on_leitura_id"

  create_table "leituras", :force => true do |t|
    t.date     "data_leitura"
    t.date     "data_vencimento"
    t.float    "leitura_anterior"
    t.float    "leitura_atual"
    t.float    "consumo"
    t.float    "valor"
    t.integer  "matricula"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
