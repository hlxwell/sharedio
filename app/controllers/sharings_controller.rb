class SharingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @sharings = current_user.sharings.all

    respond_to do |format|
      format.json { render :json => @sharings }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @sharing }
    end
  end

  def new
    @sharing = current_user.sharings.new
    @sharing.sharing_users.build

    respond_to do |format|
      format.html
      format.json { render :json => @sharing }
    end
  end

  def create
    @sharing = current_user.sharings.new params[:sharing]

    # debugger

    respond_to do |format|    
      if @sharing.save
          format.html { redirect_to @sharing, :notice => 'sharing was successfully created.' }
          format.json { render :json => @sharing, :status => :created, :location => @sharing }
      else
          format.html { render :action => "new" }
          format.json { render :json => @sharing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @sharing.update_attributes(params[:sharing])
        format.html { redirect_to @sharing, :notice => 'sharing was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sharing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @sharing.destroy

    respond_to do |format|
      format.html { redirect_to sharings_url }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @sharing = current_user.sharings.find(params[:id])
  end
end