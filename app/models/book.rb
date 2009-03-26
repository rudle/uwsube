class Book < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20

  belongs_to :user

  validates_presence_of :title, :author
  #validates_length_of :isbn, :minimum => 11

  define_index do
    #fields
    indexes :title, :sortable => true 
    indexes :author, :sortable => true 
    indexes :user_id, :sortable => true
    indexes :description
  end

  def contact_seller
    Postman.deliver_contact_seller("Hello", self)
  end


end
