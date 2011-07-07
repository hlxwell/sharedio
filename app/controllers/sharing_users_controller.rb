class SharingUsersController < ApplicationController
  before_filter :authenticate_user!, :find_sharing
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @sharing_users = @sharing.sharing_users.all

    respond_to do |format|
      format.json { render :json => @sharing_users }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @sharing_user }
    end
  end

  def new
    @sharing_user = @sharing.sharing_users.new

    respond_to do |format|
      format.html
      format.json { render :json => @sharing_user }
    end
  end

  def create
    @sharing_user = @sharing.sharing_users.build params[:sharing_user]

    respond_to do |format|
      if @sharing_user.save
        format.html { redirect_to @sharing_user, :notice => 'sharing_user was successfully created.' }
        format.json { render :json => @sharing_user, :status => :created, :location => @sharing_user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sharing_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @sharing_user.update_attributes(params[:sharing_user])
        format.html { redirect_to @sharing_user, :notice => 'sharing_user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sharing_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @sharing_user.destroy

    respond_to do |format|
      format.html { redirect_to sharing_users_url }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @sharing_user = @sharing.sharing_users.find(params[:id])
  end

  def find_sharing
    @sharing = current_user.sharings.find(params[:sharing_id])
  end
end