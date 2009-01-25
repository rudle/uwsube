require "migration_helpers"
class AddANewTable < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :books, :force => true do |t|
      t.string   :title,       :null => false
      t.string   :author
      t.string   :isbn,        :null => false
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end


    create_table :users, :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :name,                      :limit => 100, :default => ""
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at
    end

    foreign_key(:books, :user_id, :users)
  end

  def self.down
    drop_table :books
    drop_table :users
  end
end
