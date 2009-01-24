
class Book < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_length_of :isbn, :minimum => 11

  define_index do
    #fields
    indexes :title, :sortable => true 
    indexes :author, :sortable => true 
    indexes :description
  end
end
