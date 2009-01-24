require 'search'

class Book < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_length_of :isbn, :minimum => 11

  searches_on :all
end
