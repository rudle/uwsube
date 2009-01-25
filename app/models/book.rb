class Book < ActiveRecord::Base
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

end
