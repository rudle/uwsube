class Wishlist < ActiveRecord::Migration
  def self.up
    create_table :wishlist_items, :force => true do |t|
      t.string   :isbn,      :null => false
      t.datetime :expiry    
      t.integer  :user_id
      t.integer  :max_price
      t.datetime :created_at, :null => false
    end
  end

  def self.down
    drop_table :wishlist_items
  end
end
