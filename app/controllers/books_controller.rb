require 'will_paginate'
class BooksController < ApplicationController

  before_filter :login_required, :only => :new
  before_filter :store_location

  # GET /books
  # GET /books.xml
  def index
    @wishlist_item = WishlistItem.new
    if (!params[:search].nil?) 
      @books = Book.search params[:search], :page => params[:page]
    else 
      if (!params[:uid].nil?)
      @books = Book.paginate :page => params[:page], :order => 'created_at DESC'
      else
      @books = Book.search "Inventore", :page => params[:page]
      end
    end
    if (@books.size == 0)  
    else
        respond_to do |format|
        format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
    end
  end

  def list
    @books = Books.search params[:search]
  end


  # GET /books/1
  # GET /books/1.xml
  def show #Show one book with a given id
    @book = Book.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
      format.js { alert("hello") }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id

    respond_to do |format|
      if @book.save
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def contact_seller 
    @book = Book.find(params[:id])
    @seller = User.find(@book.user_id)
    Postman.deliver_contact_seller("Hello", @book)
  end

end
