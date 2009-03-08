class PriceColumn < ActiveRecord::Migration
  def self.up
    add_column "books", "price", :double
  end

  def self.down
    remove_column  "books", "price"
  end
end
