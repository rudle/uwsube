class HomeController < ApplicationController
  def index
    if (params[:search] != nil)
      redirect_to books_path + '?search=' + params[:search].to_s
    end
    @books = Book.find(:all)
  end

  def show
    redirect_to books_path
  end
end
