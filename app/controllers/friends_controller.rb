class FriendsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friends.all

    respond_to do |format|
      format.json { render :json => @friends }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @friend }
    end
  end

  def new
    @friend = current_user.friends.new

    respond_to do |format|
      format.html
      format.json { render :json => @friend }
    end
  end

  def create
    @friend = current_user.friends.new params[:friend]

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, :notice => 'friend was successfully created.' }
        format.json { render :json => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to @friend, :notice => 'friend was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @friend = current_user.friends.find(params[:id])
  end

end