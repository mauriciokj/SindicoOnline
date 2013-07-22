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

ActiveRecord::Schema.define(:version => 20130722230946) do

  create_table "apartamentos", :force => true do |t|
    t.integer  "numero"
    t.integer  "bloco"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "imovel_id"
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
    t.boolean  "paga"
  end

  add_index "apartamentos_leituras", ["apartamento_id"], :name => "index_apartamentos_leituras_on_apartamento_id"
  add_index "apartamentos_leituras", ["leitura_id"], :name => "index_apartamentos_leituras_on_leitura_id"

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cidades", ["estado_id"], :name => "index_cidades_on_estado_id"

  create_table "estados", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imoveis", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "rua"
    t.string   "bairro"
    t.integer  "cidade_id"
    t.string   "cep"
    t.string   "responsavel"
    t.string   "telefone_responsavel"
    t.string   "numero"
  end

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
    t.boolean  "paga"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "imovel_id"
    t.integer  "apartamento_id"
    t.integer  "roles_mask"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
