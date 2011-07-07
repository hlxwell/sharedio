class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @groups = current_user.groups.all

    respond_to do |format|
      format.json { render :json => @groups }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @group }
    end
  end

  def new
    @group = current_user.groups.new

    respond_to do |format|
      format.html
      format.json { render :json => @group }
    end
  end

  def create
    @group = current_user.groups.build params[:group]

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, :notice => 'group was successfully created.' }
        format.json { render :json => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @group = current_user.groups.find(params[:id])
  end
end
