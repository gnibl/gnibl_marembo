class UsersController < ApplicationController
  private
  def loggedin?
    puts @user
    @logged_in
  end
  def show_current_user
  end
  
  public
  # GET /users
  # GET /users.json
  def index
    unless session[:loggedin]
     @user = User.new
     render :action => 'new'
    else
      @user = session[:loggedin]
      redirect_to "/users/#{@user.username}"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if params[:user]
      @user = User.find_by_username(params[:user][:username])
      unless loggedin?
	session[:loggedin] = nil
        session[:currentuser] = nil
	@user = User.new
        render :action => 'new'
        return
      else
	session[:loggedin] = @user
        session[:currentuser] = @user
	redirect_to "/users/#{@user.username}"
	return
      end
    elsif params[:id]
      username = params[:id];
      unless username == 'show'
        @user = User.find_by_username(params[:id])
        session[:currentuser] = @user
      end
    end
    if @user
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
#    redirect_to "/users/#{@user.username}";
    else
      @user = User.new
      render :action => 'new'
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
