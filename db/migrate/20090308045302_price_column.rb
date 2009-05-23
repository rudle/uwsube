class PriceColumn < ActiveRecord::Migration
  def self.up
    add_column "books", "price", :real
  end

  def self.down
    remove_column  "books", "price"
  end
end
