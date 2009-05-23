class UsersController < ApplicationController
  # render new.rhtml
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  #GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up! You are now logged in as #{@user}" 
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
