class HomeController < ApplicationController
  before_filter :store_location
  def index
    if (params[:search] != nil)
      redirect_to books_path + '?search=' + params[:search].to_s
    end
    @books = Book.find(:all)
  end

end
