class HomeController < ApplicationController
  before_filter :store_location
  def index
    if (params[:search] != nil)
      redirect_to books_path + '?search=' + params[:search].to_s
    end
    @books = Book.find(:all, :order => "created_at DESC", :limit => 5)
  end
  def tab_link_to(name, options={}, html_options={}) 
    html_options.merge!({ :id => 'current' }) if current_page?(options)
    link_to name, options, html_options 
  end
end
