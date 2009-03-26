class WishlistItemsController < ApplicationController
  # GET /wishlist_items
  # GET /wishlist_items.xml
  def index
    @wishlist_items = WishlistItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wishlist_items }
    end
  end

  # GET /wishlist_items/1
  # GET /wishlist_items/1.xml
  def show
    @wishlist_item = WishlistItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wishlist_items }
    end
  end

  # GET /wishlist_items/new
  # GET /wishlist_items/new.xml
  def new
    @wishlist_item = WishlistItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wishlist_items }
    end
  end

  # GET /wishlist_items/1/edit
  def edit
    @wishlist_items = WishlistItem.find(params[:id])
  end

  # POST /wishlist_items
  # POST /wishlist_items.xml
  def create
    @wishlist_item = WishlistItem.new(params[:wishlist_item])
    @wishlist_item.user_id = current_user.id

    respond_to do |format|
      if @wishlist_item.save
        flash[:notice] = 'WishlistItem was successfully created.'
        format.html { redirect_to(@wishlist_item) }
        format.xml  { render :xml => @wishlist_item, :status => :created, :location => @wishlist_items }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wishlist_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wishlist_items/1
  # PUT /wishlist_items/1.xml
  def update
    @wishlist_item = WishlistItem.find(params[:id])

    respond_to do |format|
      if @wishlist_item.update_attributes(params[:wishlist_item])
        flash[:notice] = 'WishlistItem was successfully updated.'
        format.html { redirect_to(@wishlist_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wishlist_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlist_items/1
  # DELETE /wishlist_items/1.xml
  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy

    respond_to do |format|
      format.html { redirect_to(wishlist_items_url) }
      format.xml  { head :ok }
    end
  end
end
