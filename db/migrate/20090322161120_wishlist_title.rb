class WishlistTitle < ActiveRecord::Migration
  def self.up
    add_column "wishlist_items", "title", :string, :null => false
  end

  def self.down
    remove_column "wishlist_items", "title"
  end
end
